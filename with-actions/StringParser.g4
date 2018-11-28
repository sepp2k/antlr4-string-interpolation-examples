parser grammar StringParser;

options {
    tokenVocab = 'StringLexer';
}

start: exp EOF ;

exp : '(' exp ')'
    | IDENTIFIER
    | DQUOTE stringContents* DQUOTE
    ;

stringContents : TEXT
               | ESCAPE_SEQUENCE
               | '\\(' exp ')'
               ;