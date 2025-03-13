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

(identifier) @variable

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
] @boolean

;; Tables

(field name: (identifier) @variable)

(dot_index_expression field: (identifier) @variable)

(table_constructor
[
  "{"
  "}"
] @constructor)

;; Functions

(parameters (identifier) @variable.parameter)

(function_declaration
  name: [
    (identifier) @function
    (dot_index_expression
      field: (identifier) @function)
  ])

(function_declaration
  name: (method_index_expression
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
  name: [
    (identifier) @function.call
    (dot_index_expression
      field: (identifier) @function.call)
    (method_index_expression
      method: (identifier) @method.call)
  ])

(table_constructor
  (field
    name: (identifier) @variable
    value: (function_definition)))

(function_call
  (identifier) @function.builtin
  (#any-of? @function.builtin
    ;; built-in functions in Lua 5.1
    "assert" "collectgarbage" "dofile" "error" "getfenv" "getmetatable" "ipairs"
    "load" "loadfile" "loadstring" "module" "next" "pairs" "pcall" "print"
    "rawequal" "rawget" "rawset" "require" "select" "setfenv" "setmetatable"
    "tonumber" "tostring" "type" "unpack" "xpcall"))

;; Others

"//" @comment

(comment) @comment

(hash_bang_line) @preproc

(number) @constant.builtin

(string) @string

(escape_sequence) @string.escape
