/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex

%%


/*%token block*/

\;[^\r\n]*                  /* skip more shit */
\s+                         /* skip shit */
\"[^\"]\"                  return 'STRING'
")"                        return ')'
"("                        return '('
[0-9]+                     return 'NUMBER'
'add'                      return '+'
'+'                        return '+'
'-'                        return '-'
'/'                        return '/'
'*'                        return '*'
'%'                        return '%'
'and'                      return 'and'
'or'                       return 'or'
'<='                       return '<='
'>='                       return '>='
'!='                       return '!='
'='                        return '='
'<'                        return '<'
'>'                        return '>'
'!'                        return '!'
'seq'                      return 'SEQ'
'if'                       return 'IF'
'when'                     return 'WHEN'
'unless'                   return 'UNLESS'
'for'                      return 'FOR'
\w+                        return 'WORD'
<<EOF>>                    return 'EOF'



/lex


%start LISP

%% /* language grammar */

LISP: LIST EOF
    |
    ;

LIST: '(' EXPR ')'
    | ATOM
    ;

SEQUENCE: LIST SEQUENCE
   | 
   ;

ATOM: WORD
    | STRING
    | NUMBER
    ;

EXPR: ARETH_OP SEQUENCE
    | LOGICAL_OP SEQUENCE
    | BIN_OP SEQUENCE
    | '!' LIST
    | SEQ SEQUENCE
    | IF LIST LIST LIST
    | WHEN LIST LIST
    | UNLESS LIST LIST
    | FOR LIST LIST
    | ATOM ATOM
    | ATOM 
    ;

ARETH_OP: '+'
       | '-'
       | '*'
       | '/'
       | '%'
       ;

LOGICAL_OP: 'and'
          | 'or'
          ;

BIN_OP: '<'
      | '<='
      | '>'
      | '>='
      | '='
      | '!='
      ;


%%
