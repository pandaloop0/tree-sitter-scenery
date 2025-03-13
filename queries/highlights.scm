;; Keywords

"retfn" @keyword.return

[
 "goto"
 "let"
] @keyword

(label_statement) @label

(break_statement) @keyword

(do_statement
[
  "do"
] @keyword)

(while_statement
[
  "while"
  "do"
] @keyword)

(repeat_statement
[
  "repeat"
  "until"
] @keyword)

(if_statement
[
  "if"
  "else"
] @keyword)

(else_statement
[
  "else"
] @keyword)

(for_statement
[
  "for"
] @keyword)

(function_declaration
[
  "fn"
] @keyword.function)

(function_definition
[
  "fn"
] @keyword.function)

;; Operators

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "^"
  "#"
  "=="
  "!="
  "<="
  ">="
  "<"
  ">"
  "="
  "&"
  "&&"
  "||"
  "~"
  "|"
  "<<"
  ">>"
  ".."
] @operator

;; Punctuations

[
  ";"
  ":"
  ","
  "."
] @punctuation.delimiter

;; Brackets

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
] @punctuation.bracket

;; Variables

((identifier) @variable.builtin
 (#eq? @variable.builtin "self"))

(variable_list
  (attribute
    "<" @punctuation.bracket
    (identifier) @attribute
    ">" @punctuation.bracket))

;; Constants

((identifier) @constant
 (#match? @constant "^[A-Z][A-Z_0-9]*$"))

(vararg_expression) @constant

(nil) @constant.builtin

[
  (false)
  (true)
] @constant.builtin.boolean

;; Tables

(field name: (identifier) @variable)

(dot_index_expression field: (identifier) @variable)

(table_constructor
[
  "{"
  "}"
] @constructor)

;; Functions

(parameters name: (identifier) @variable.parameter)

; (function_declaration
;   fn_name: [
;     (identifier) @constant.builtin.boolean
;     (dot_index_expression
;       field: (identifier) @function)
;   ])

(function_declaration
  fn_name: (identifier) @function)

(function_declaration
  fn_name: (method_index_expression
    method: (identifier) @method))

(assignment_statement
  (variable_list .
    name: [
      (identifier) @function
      (dot_index_expression
        field: (identifier) @function)
    ])
  (expression_list .
    value: (function_definition)))

(function_call
  fn_name: [
    (identifier) @function
    (dot_index_expression
      field: (identifier) @function.call)
    (method_index_expression
      method: (identifier) @method.call)
  ])

(table_constructor
  (field
    name: (identifier) @variable
    value: (function_definition)))

;; Others

"//" @comment

(comment) @comment

(hash_bang_line) @preproc

(number) @constant.numeric.float

(string) @string

(escape_sequence) @string.escape

(identifier) @variable

