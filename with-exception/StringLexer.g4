lexer grammar StringLexer;

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]* ;
DQUOTE: '"' -> pushMode(IN_STRING);
LPAR: '(' -> pushMode(DEFAULT_MODE);
RPAR: ')' -> popMode;

mode IN_STRING;

TEXT: ~[\\"]+ ;

BACKSLASH_PAREN: '\\(' -> pushMode(DEFAULT_MODE);

ESCAPE_SEQUENCE: '\\' . ;

DQUOTE_IN_STRING: '"' -> type(DQUOTE), popMode;