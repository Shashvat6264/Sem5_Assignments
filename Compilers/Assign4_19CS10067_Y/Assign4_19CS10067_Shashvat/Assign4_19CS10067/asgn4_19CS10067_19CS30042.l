/*********************
Assignment Number: 4
Assignment Name: Parser for tinyC
Team Number: 26
Team Members:
    Shashvat Gupta 19CS30042
    Yashica Patodia 19CS10067
*********************/

%{

    #include "y.tab.h"
    #include <math.h>
    void comment(void);
    extern void yyerror(const char *);

    

%}

DIGIT                       [0-9]
NONDIGIT                    [a-zA-Z_]
IDENTIFIER                  {NONDIGIT}([a-zA-Z0-9_])*

ESCAPE_SEQUENCE             \\['"?\\abfnrtv]
INTEGER_CONSTANT            [1-9][0-9]*|[0]+

DIGIT_SEQUENCE              [0-9]+
EXPONENT_PART               ([Ee]([+-]?)({DIGIT_SEQUENCE}))
FRAC_CONSTANT               {DIGIT_SEQUENCE}\.|{DIGIT_SEQUENCE}?\.{DIGIT_SEQUENCE}
FLOAT_CONST                 ({DIGIT_SEQUENCE}{EXPONENT_PART})|({FRAC_CONSTANT}{EXPONENT_PART}?)

ENUM_CONST                  {IDENTIFIER}

C_CHAR                      [^\'\n\\]|{ESCAPE_SEQUENCE}
C_CHAR_SEQUENCE             ({C_CHAR})+
CHAR_CONSTANT               \'({C_CHAR_SEQUENCE})\'        

S_CHAR                      [^\"\n\\]|{ESCAPE_SEQUENCE}
S_CHAR_SEQUENCE             ({S_CHAR})+
STRING_LITERAL              \"({S_CHAR_SEQUENCE})?\"

OTHER                       [\t\v\n\f]


%%

"/*"            {comment();}
"//".*          { printf("SINGLE_LINE_COMMENT");}
"sizeof"        { return SIZEOF; }
"extern"        { return EXTERN; }
"static"        { return STATIC; }
"auto"          { return AUTO; }
"register"      { return REGISTER; }
"void"          { return VOID; }
"char"          { return CHAR; }
"short"         { return SHORT; }
"int"           { return INT; }
"long"          { return LONG; }
"float"         { return FLOAT; }
"double"        { return DOUBLE; }
"signed"        { return SIGNED; }
"unsigned"      { return UNSIGNED; }
"_Bool"         { return BOOL; }
"_Complex"      { return COMPLEX; }
"_Imaginary"    { return IMAGINARY; }
"enum"          { return ENUM; }
"const"         { return CONST; }
"restrict"      { return RESTRICT; }
"volatile"      { return VOLATILE; }
"inline"        { return INLINE; }
"case"          { return CASE; }
"default"       { return DEFAULT; }
"if"            { return IF; }
"else"          { return ELSE; }
"switch"        { return SWITCH; }
"while"         { return WHILE; }
"do"            { return DO; }
"for"           { return FOR; }
"goto"          { return GOTO; }
"continue"      { return CONTINUE; }
"break"         { return BREAK; }
"return"        { return RETURN; }

{STRING_LITERAL}            {return STRING_LITERAL;}
{IDENTIFIER}                {return IDENTIFIER;}
{INTEGER_CONSTANT}                     {return INT_CONSTANT;}
{FLOAT_CONST}                        {return FLOAT_CONSTANT;}
{CHAR_CONSTANT}                {return CHAR_CONSTANT;}




"["             { return OPENSQUAREB; }
"]"             { return CLOSESQUAREB; }
"("             { return OPENROUNDB; }
")"             { return CLOSEROUNDB; }
"{"             { return OPENCURLYB; }
"}"             { return CLOSECURLYB; }
"."             { return DOT; }
"->"            { return ARROW; }
"--"            { return DECREMENT; }
"++"            { return INCREMENT; }
"&"             { return BITWISEAND; }
"*"             { return STAR; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"~"             { return NOT; }
"!"             { return EXCLAMATION; }
"/"             { return DIVIDE; }
"%"             { return PERCENTAGE; }
"<<"            { return LEFTSHIFT; }
">>"            { return RIGHTSHIFT; }
"<"             { return LESSTHAN; }
">"             { return GREATERTHAN; }
"<="            { return LESSEQUAL; }
">="            { return GREATEREQUAL; }
"^"             { return XOR; }
"|"             { return BITWISEOR;}
"&&"            { return AND; }
"||"            { return OR; }
"=="            { return EQUAL; }
"!="            { return NOTEQUAL; }
"?"             { return QUESTIONMARK; }
":"             { return COLON; }
";"             { return SEMICOLON; }
"..."           { return ELLIPSIS; }
"="             { return ASSIGN; }
"*="            { return MULTIPLYASSIGN; }
"/="            { return DIVIDEASSIGN; }
"%="            { return MODULOASSIGN; }
"+="            { return PLUSASSIGN; }
"-="            { return MINUSASSIGN; }
"<<="           { return SHIFTLEFTASSIGN; }
">>="           { return SHIFTRIGHTASSIGN; }
"&="            { return ANDASSIGN; }
"^="            { return XORASSIGN; }
"|="            { return ORASSIGN; }
","             { return COMMA; }
"#"             { return HASH; }

{OTHER}         {}

%%

void comment(void)
{
    printf("MULTI_LINE_COMMENT");
    char ch,i=0;
    while((ch=input())!=0)
    {
        if(ch=='/' && i=='*')
        return ;
        i=ch;
    }
    
}