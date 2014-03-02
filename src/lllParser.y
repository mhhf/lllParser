/* description: Parses end executes mathematical expressions. */

/* lexical grammar */
%lex

%%


/*%token block*/

\;[^\r\n]*                  /* skip more shit */
\s+                         /* skip shit */
\"[^\"]*\"                 return 'STRING'
")"                        return ')'
"("                        return '('
'0x'+[0-9a-f]*             return 'NUMBER'
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
\w+                        return 'INSTRUCTION'
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

ATOM: STRING
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
    | ATOM LIST
    | ATOM 
    | INSTRUCTION SEQUENCE
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
