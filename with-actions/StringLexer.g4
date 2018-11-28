lexer grammar StringLexer;

@members {
    int nesting = 0;
}

IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]* ;
DQUOTE: '"' -> pushMode(IN_STRING);
LPAR: '(' {
    nesting++;
    pushMode(DEFAULT_MODE);
};
RPAR: ')' {
    if (nesting > 0) {
        nesting--;
        popMode();
    }
};

mode IN_STRING;

TEXT: ~[\\"]+ ;

BACKSLASH_PAREN: '\\(' {
    nesting++;
    pushMode(DEFAULT_MODE);
};

ESCAPE_SEQUENCE: '\\' . ;

DQUOTE_IN_STRING: '"' -> type(DQUOTE), popMode;