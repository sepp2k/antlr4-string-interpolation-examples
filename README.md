# Examples for handling string interpolation in ANTLR4

This repository contains three approaches to lexing and parsing string literals with string interpolation in ANTLR4 using lexical modes. The syntax implemented here is `"text \(expression) more text"`, but of course this can be easily adjusted to use `${}`, `#{}` or whichever syntax you prefer.

* The version in the directory `with-exception` will throw an empty stack exception if there is an unmatched `)` in the source.
* The version in `with-actions` contains actions with Java code and thus will have to be adjusted when targetting a language other than Java (unless the language is similar enough that the code still happens to be valid in that language)
* The version in `with-duplication` doesn't have either of these drawbacks, but has to duplicate all of the token definitions. It also prevents the use of string literals in the parser (i.e. you have to write `LPAR` instead of `(` etc.)

For more information see [my answer on Stack Overflow](https://stackoverflow.com/questions/53504903/parse-string-antlr/53524929#53524929).