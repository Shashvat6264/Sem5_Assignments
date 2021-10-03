/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AUTO = 258,
    BREAK = 259,
    CASE = 260,
    CHAR = 261,
    CONST = 262,
    CONTINUE = 263,
    DEFAULT = 264,
    DO = 265,
    DOUBLE = 266,
    ELSE = 267,
    ENUM = 268,
    EXTERN = 269,
    REGISTER = 270,
    FLOAT = 271,
    FOR = 272,
    GOTO = 273,
    IF = 274,
    INLINE = 275,
    INT = 276,
    LONG = 277,
    RESTRICT = 278,
    RETURN = 279,
    SHORT = 280,
    SIGNED = 281,
    SIZEOF = 282,
    STATIC = 283,
    STRUCT = 284,
    SWITCH = 285,
    TYPEDEF = 286,
    UNION = 287,
    UNSIGNED = 288,
    VOID = 289,
    VOLATILE = 290,
    WHILE = 291,
    BOOL = 292,
    COMPLEX = 293,
    IMAGINARY = 294,
    OPENSQUAREB = 295,
    CLOSESQUAREB = 296,
    OPENROUNDB = 297,
    CLOSEROUNDB = 298,
    OPENCURLYB = 299,
    CLOSECURLYB = 300,
    DOT = 301,
    ARROW = 302,
    INCREMENT = 303,
    DECREMENT = 304,
    BITWISEAND = 305,
    STAR = 306,
    PLUS = 307,
    MINUS = 308,
    NOT = 309,
    EXCLAMATION = 310,
    DIVIDE = 311,
    PERCENTAGE = 312,
    LEFTSHIFT = 313,
    RIGHTSHIFT = 314,
    LESSTHAN = 315,
    GREATERTHAN = 316,
    LESSEQUAL = 317,
    GREATEREQUAL = 318,
    EQUAL = 319,
    NOTEQUAL = 320,
    XOR = 321,
    BITWISEOR = 322,
    AND = 323,
    OR = 324,
    QUESTIONMARK = 325,
    COLON = 326,
    SEMICOLON = 327,
    ELLIPSIS = 328,
    ASSIGN = 329,
    MULTIPLYASSIGN = 330,
    DIVIDEASSIGN = 331,
    MODULOASSIGN = 332,
    PLUSASSIGN = 333,
    MINUSASSIGN = 334,
    SHIFTLEFTASSIGN = 335,
    SHIFTRIGHTASSIGN = 336,
    ANDASSIGN = 337,
    XORASSIGN = 338,
    ORASSIGN = 339,
    COMMA = 340,
    HASH = 341,
    IDENTIFIER = 342,
    INT_CONSTANT = 343,
    FLOAT_CONSTANT = 344,
    CHAR_CONSTANT = 345,
    STRING_LITERAL = 346
  };
#endif
/* Tokens.  */
#define AUTO 258
#define BREAK 259
#define CASE 260
#define CHAR 261
#define CONST 262
#define CONTINUE 263
#define DEFAULT 264
#define DO 265
#define DOUBLE 266
#define ELSE 267
#define ENUM 268
#define EXTERN 269
#define REGISTER 270
#define FLOAT 271
#define FOR 272
#define GOTO 273
#define IF 274
#define INLINE 275
#define INT 276
#define LONG 277
#define RESTRICT 278
#define RETURN 279
#define SHORT 280
#define SIGNED 281
#define SIZEOF 282
#define STATIC 283
#define STRUCT 284
#define SWITCH 285
#define TYPEDEF 286
#define UNION 287
#define UNSIGNED 288
#define VOID 289
#define VOLATILE 290
#define WHILE 291
#define BOOL 292
#define COMPLEX 293
#define IMAGINARY 294
#define OPENSQUAREB 295
#define CLOSESQUAREB 296
#define OPENROUNDB 297
#define CLOSEROUNDB 298
#define OPENCURLYB 299
#define CLOSECURLYB 300
#define DOT 301
#define ARROW 302
#define INCREMENT 303
#define DECREMENT 304
#define BITWISEAND 305
#define STAR 306
#define PLUS 307
#define MINUS 308
#define NOT 309
#define EXCLAMATION 310
#define DIVIDE 311
#define PERCENTAGE 312
#define LEFTSHIFT 313
#define RIGHTSHIFT 314
#define LESSTHAN 315
#define GREATERTHAN 316
#define LESSEQUAL 317
#define GREATEREQUAL 318
#define EQUAL 319
#define NOTEQUAL 320
#define XOR 321
#define BITWISEOR 322
#define AND 323
#define OR 324
#define QUESTIONMARK 325
#define COLON 326
#define SEMICOLON 327
#define ELLIPSIS 328
#define ASSIGN 329
#define MULTIPLYASSIGN 330
#define DIVIDEASSIGN 331
#define MODULOASSIGN 332
#define PLUSASSIGN 333
#define MINUSASSIGN 334
#define SHIFTLEFTASSIGN 335
#define SHIFTRIGHTASSIGN 336
#define ANDASSIGN 337
#define XORASSIGN 338
#define ORASSIGN 339
#define COMMA 340
#define HASH 341
#define IDENTIFIER 342
#define INT_CONSTANT 343
#define FLOAT_CONSTANT 344
#define CHAR_CONSTANT 345
#define STRING_LITERAL 346

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 17 "asgn4_19CS10067_19CS30042.y"

    int intValue;
    double doubleValue;
    

#line 245 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
