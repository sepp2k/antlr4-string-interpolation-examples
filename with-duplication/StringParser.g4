parser grammar StringParser;

options {
    tokenVocab = 'StringLexer';
}

start: exp EOF ;

exp : LPAR exp RPAR
    | IDENTIFIER
    | DQUOTE stringContents* DQUOTE
    ;

stringContents : TEXT
               | ESCAPE_SEQUENCE
               | BACKSLASH_PAREN exp RPAR
               ;