; Simplified TypeScript Semantic Highlighting
; Only using well-established node types to avoid parser compatibility issues

; === TypeScript Type System ===

; Built-in TypeScript types - using only stable type_identifier patterns
(type_identifier) @type.builtin
  (#any-of? @type.builtin 
    "string" "number" "boolean" "object" "undefined" "null" "void" "never" 
    "unknown" "any" "bigint" "symbol" "Promise" "Array")

; Props and State type patterns
(type_identifier) @type.props
  (#match? @type.props "Props$")

(type_identifier) @type.state  
  (#match? @type.state "State$")

; === Interface and Type Definitions ===

; Interface declarations
(interface_declaration
  name: (type_identifier) @type.definition)

; Type alias declarations  
(type_alias_declaration
  name: (type_identifier) @type.definition)

; === Basic Keywords ===

; Type assertion
(as_expression "as" @keyword.type)

; === Operators ===

; Optional and assertion operators
"!" @operator.assertion
"?" @operator.conditional

; === TypeScript Object Types and Annotations ===

; Object type definitions - make darker
(object_type) @type.object.dark

; Type annotations - make darker  
(type_annotation) @type.annotation.dark

; === Comments ===

; JSDoc comments
(comment) @comment.documentation
  (#match? @comment.documentation "^/\\*\\*")