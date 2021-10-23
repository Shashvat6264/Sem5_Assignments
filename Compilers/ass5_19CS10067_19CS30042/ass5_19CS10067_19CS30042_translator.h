/**
 * Authors  : Yashica Patodia (19CS10067) 
 *            Shashvat Gupta (19CS30042) 
 * Desc     : Header file for the translation statements
 */


#ifndef _TRANSLATE_H
#define _TRANSLATE_H

#include <bits/stdc++.h>

extern int yyparse();
extern char* yytext;

using namespace std;

// Class Declarations        

class sym;                                                                                 // Stands for an entry in ST
class quad;                                                                                // Stands for a single entry in the quad Array
class label;                                                                               // Stands for a single label entry in the label table
class symboltype;                                                                          // Stands for the type of a symbol in ST
class Expression;                                                                          // Stands for the expression type data storage
class symtable;                                                                            // Stands for Symbol Table
class basicType;                                                                           // Stands for the basic type data
class quadArray;                                                                           // Stands for the Array of quads

typedef sym s;
typedef symboltype symtyp;
typedef Expression* Exps;

// Global variables               

extern symtable* ST;                                                                       // Denotes the current Symbol Table
extern symtable* globalST;                                                                 // Denotes the Global Symbol Table
extern symtable* parST;                                                                    // Denotes the Parent of the current Symbol Table
extern s* currSymbolPtr;                                                                   // Denotes the latest encountered symbol
extern bool debug_on;                                                                      // Bool for printing debug output
extern string loop_name;                                                                   // Get the name of the loop
extern vector<label>label_table;                                                           // Table to store the labels
extern quadArray Q;                                                                        // Denotes the quad Array
extern basicType bt;                                                                       // Denotes the Type ST
extern long long int table_count;                                                          // Denotes count of nested tables

// Defination of structure of each element of the symbol table 
class sym{                                                                                          
	public:
        string name;                                                                       // Denotes the name of the symbol
        symboltype *type;                                                                  // Denotes the type of the symbol
        int size;                                                                          // Denotes the size of the symbol
        int offset;                                                                        // Denotes the offset of symbol in ST
        symtable* nested;                                                                  // Points to the nested symbol table
        string val;                                                                        // Initial value of the symbol
          
        sym (string, string t="int", symboltype* ptr = NULL, int width = 0);              
        sym* update(symboltype*);                                                          // Method to update different fields of an existing entry.
};

// Defination of the label symbol          
class label{
    public:
        string name;                                                                       // Stores the name of the label
        int addr;                                                                          // Stores the address the label is pointing to
        list<int> nextlist;                                                                // List of dangling goto statements

        label(string _name, int _addr = -1);                                               // Label method
};

// Defination of the symbol type          
class symboltype{                                                                                           
    public:
        string type;                                                                        // Stores the type of symbol. 
        int width;                                                                          // Stores the size of Array (if we encounter an Array) and it is 1 in default case
        symboltype* arrtype;                                                                // For storing the typr of the array in recursive manner
        
        symboltype(string, symboltype* ptr = NULL, int width = 1);                          
};

// Defination for the Symbol Table       
class symtable{                                                                                           
    public:
        string name;                                                                        // Name of the Table
        int count;                                                                          // Count of the temporary variables
        list<sym> table;                                                                    // The table of symbols which is essentially a list of sym
        symtable* parent;                                                                   // Parent ST of the current ST
        
        symtable (string name="NULL");                                                      
        s* lookup (string);                                                                 // Lookup for a symbol in ST
        void print();                                                                       // Print the ST
        void update();                                                                      // Update the ST
};

// Defination of the struct of quad element    
class quad{                                                                                            
    public:                                                                                  // A single quad has four components:
        string res;                                                                          // Result
        string op;                                                                           // Operator
        string arg1;                                                                         // Argument 1
        string arg2;                                                                         // Argument 2

	    // Printing the Quad
        void print();	
        void type1();                                                                        // For printing binary operators
        void type2();                                                                        // For printing relational operators and jumps

        // Constructors
        quad (string, string, string op = "=", string arg2 = "");			
        quad (string, int, string op = "=", string arg2 = "");				
        quad (string, float, string op = "=", string arg2 = "");			
};

// Defination of the quad array type
class quadArray{                                                                             
    public:
        vector<quad> Array;                                                                  // Simply an Array (vector) of quads
        void print();                                                                        // Print the quadArray
};

// Defination of the basic type
class basicType{                                                                             
    public:
        vector<string> type;                                                                 // Type name
        vector<int> size;                                                                    // Size of the type
        void addType(string, int);
};

// Defination of the expression type
struct Expression{
    s* loc;                                                                                  // Pointer to the symbol table entry
    string type;                                                                             // To store whether the expression is of type int or bool or float or char
    list<int> truelist;                                                                      // Truelist for boolean expressions
    list<int> falselist;                                                                     // Falselist for boolean expressions
    list<int> nextlist;                                                                      // For statement expressions
};

// Attributes of the array type element
struct Array{
    string atype;                                                                            // Used for type of Array: may be "ptr" or "arr" type
    s* loc;                                                                                  // Location used to compute address of Array
    s* Array;                                                                                // Pointer to the symbol table entry
    symboltype* type;                                                                        // Type of the subarr1 generated (important for multidimensional arr1s)
};

struct Statement{
    list<int> nextlist;                                                                      // Nextlist for Statement with dangling exit
};

// Overloaded emit function used by the parser
void emit(string, string, string arg1="", string arg2 = "");  
void emit(string, string, int, string arg2 = "");		  
void emit(string, string, float, string arg2 = "");   

/*
 * GENTEMP
 * -------
 * Generates a temporary variable 
 * and inserts it in the current 
 * Symbole table 
 * 
 * Parameter
 * ---------
 * symbol type * : Pointer to the 
 *                 class of symbol type
 * init : Initial value of the structure
 * 
 * Return
 * ------
 * Pointer to the newly created symbol 
 * table entry
 */
s* gentemp(symboltype *, string init = "");

// Backpatching and related functions
void backpatch(list<int>, int);                                                            // Backpatch the dangling instructions with the given address(parameter) 
list<int> makelist(int);                                                                   // Make a new list contanining an integer address
list<int> merge(list<int> &l1, list<int> &l2);                                             // Merge two lists into a single list

// Other helper functions required for TAC generation        
label* find_label(string);

// Type checking and Type conversion functions
Exps convertIntToBool(Exps);                                                                 // Converts int expression to boolean
Exps convertBoolToInt(Exps);                                                                 // Converts boolean expression to int
string convertIntToString(int);                                                              // Converts integer to string
string convertFloatToString(float);                                                          // Converts float to string

s* convertType(sym *, string);                                                               // For type conversion
int computeSize(symboltype *);                                                               // To calculate size of symbol type
void changeTable(symtable *);                                                                // To change current table
bool compareSymbolType(sym* &s1, sym* &s2);                                                  // To check for same type of two symbol table entries
bool compareSymbolType(symboltype*, symboltype*);                                            // To check for same type of two symboltype objects
int nextinstr();                                                                             // Returns the next instruction number

// Other helper function for debugging and printing 
string printType(symboltype *);                                                             
void generateSpaces(int);

#endif