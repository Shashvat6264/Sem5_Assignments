%{
	/**
	* Authors  : Yashica Patodia (19CS10067) 
	*            Shashvat Gupta (19CS30042) 
	* Desc     : Lex file
	*/

	#include <stdio.h>
	#include <string.h>
	#include "ass5_19CS10067_19CS30042_translator.h"
	#include "ass5_19CS10067_19CS30042.tab.h"
    extern YYSTYPE yylval;
    extern int line;
    int line = 1;
%}
/*Definition of regular expression*/

%option noyywrap


/* Regular Expression Definations */
LETTER          [a-zA-Z]
DIGIT           [0-9]
NON_ZERO        [1-9]
DIGIT_SEQ       {DIGIT}{DIGIT}*
ESCAPE_SEQ      "\\\'"|"\\\""|"\\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v"

C_CHAR          [^\'\\\n]|{ESCAPE_SEQ}
S_CHAR          [^\"\\\n]|{ESCAPE_SEQ}
CHAR_SEQ        {C_CHAR}{C_CHAR}*
STRING_SEQ      {S_CHAR}{S_CHAR}*

STRING          \"{STRING_SEQ}\"|\"\"

IDENTIFIER      ({LETTER}|"_")({LETTER}|{DIGIT}|"_")*

FRAC            {DIGIT_SEQ}\.|\.{DIGIT_SEQ}|{DIGIT_SEQ}\.{DIGIT_SEQ}
FLOAT_CONST     ({FRAC}|{DIGIT_SEQ})([Ee]([-+]{DIGIT_SEQ}|{DIGIT_SEQ}))|{FRAC}|"0"*\."0"*
INT_CONST       {NON_ZERO}{DIGIT}*|"0"+
CHAR_CONST      \'{CHAR_SEQ}\'


COMMENT_LINE    "//".*
COMMENT_MULTI   "/*"([^*]|\*+[^/*])*\**(\*"/")? 
WS              [ \t]
NEWLINE         [\n]

%%

{COMMENT_LINE}          { /* Single line comment will be ignored by the parser */ }
{COMMENT_MULTI}         { /* Multi line comment will be ignored by the parser */  }

"if"                    { return IF;       }
"do"                    { return DO;       }
"for"                   { return FOR;      }
"int"                   { return INT;      }
"void"                  { return VOID;     }
"short"                 { return SHORT;    }
"float"                 { return FLOAT;    }
"break"                 { return BREAK;    }
"return"                { return RETURN;   }
"else"                  { return ELSE;     }
"char"                  { return CHAR;     }
"case"                  { return CASE;     }
"goto"                  { return GOTO;     }
"restrict"              { return RESTRICT; }
"continue"              { return CONTINUE; }
"const"                 { return CONST;    }
"union"                 { return UNION;    }
"while"                 { return WHILE;    }
"switch"                { return SWITCH;   }
"typedef"               { return TYPEDEF;  }
"default"               { return DEFAULT;  }
"volatile"              { return VOLATILE; }
"long"                  { return LONG;     }
"static"                { return STATIC;   }
"struct"                { return STRUCT;   }
"extern"                { return EXTERN;   }
"sizeof"                { return SIZEOF;   }
"inline"                { return INLINE;   }
"double"                { return DOUBLE;   }

"..."                   { return DOTS;                 }
"<<="                   { return SL_EQ;                }
"<<"                    { return SHIFT_LEFT;           }
">>"                    { return SHIFT_RIGHT;          }
">>="                   { return SR_EQ;                }
"<="                    { return LTE;                  }
">="                    { return GTE;                  }
"-="                    { return SUB_EQ;               }
"&="                    { return BITWISE_AND_EQ;       }
"^="                    { return BITWISE_XOR_EQ;       }
"->"                    { return IMPLIES;              }
"=="                    { return EQ;                   }
"*="                    { return STAR_EQ;              }
"/="                    { return DIV_EQ;               }
"%="                    { return MOD_EQ;               }
"+="                    { return ADD_EQ;               }
"!="                    { return NEQ;                  }
"|="                    { return BITWISE_OR_EQ;        }
"&&"                    { return AND;                  }
"||"                    { return OR;                   }
"--"                    { return DEC;                  }
"++"                    { return INC;                  }

"["                     { return SQUARE_BRACKET_OPEN;  }
"]"                     { return SQUARE_BRACKET_CLOSE; }
"("                     { return ROUND_BRACKET_OPEN;   }
")"                     { return ROUND_BRACKET_CLOSE;  }
"{"                     { return CURLY_BRACKET_OPEN;   }
"}"                     { return CURLY_BRACKET_CLOSE;  }

";"                     { return SEMICOLON;  }

"#"                     { return HASH;       }
"."                     { return DOT;        }
"&"                     { return BITWISE_AND;}
"*"                     { return MUL;        }
"+"                     { return ADD;        }
"-"                     { return SUB;        }
"~"                     { return BITWISE_NOT;}
"!"                     { return EXCLAIM;    }
"/"                     { return DIV;        }
"%"                     { return MOD;        }
"<"                     { return BIT_SL;     }
">"                     { return BIT_SR;     }
","                     { return COMMA;      }
"="                     { return ASSIGN;     }
"?"                     { return QUESTION;   }
"^"                     { return BITWISE_XOR;}
"|"                     { return BITWISE_OR; }
":"                     { return COLON;      }

{INT_CONST}             { 
	                        yylval.intval = atoi(yytext);
							return INTEGER_CONSTANT; /* Constant Rule */ 
                        }
{CHAR_CONST}            { 
	                        yylval.char_value = yytext;
							return CHARACTER_CONSTANT; /* Constant Rule */ 
						}
{FLOAT_CONST}           { 
	                        yylval.char_value = yytext;
	                        return FLOATING_CONSTANT; /* Constant Rule */ 
						}

{IDENTIFIER}            { 
	                        yylval.symp = ST->lookup(yytext);
							return IDENTIFIER; /* Identifier Rule */ 
						}

{STRING}                { 
	                        yylval.char_value = yytext;
							return STRING_LITERAL; /* String-literal */ 
						}

{WS}                    { /* White-space Rule */ }
{NEWLINE}               { /* New-line Rule */ }

%%