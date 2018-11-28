lexer grammar StringLexer;

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]* ;
DQUOTE: '"' -> pushMode(IN_STRING);
LPAR: '(';
RPAR: ')';

mode IN_STRING;

TEXT: ~[\\"]+ ;

BACKSLASH_PAREN: '\\(' -> pushMode(EMBEDDED);

ESCAPE_SEQUENCE: '\\' . ;

DQUOTE_IN_STRING: '"' -> type(DQUOTE), popMode;

mode EMBEDDED;

E_IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]* -> type(IDENTIFIER);
E_DQUOTE: '"' -> pushMode(IN_STRING), type(DQUOTE);
E_LPAR: '(' -> type(LPAR), pushMode(EMBEDDED);
E_RPAR: ')' -> type(RPAR), popMode;
