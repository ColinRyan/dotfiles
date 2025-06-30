; TypeScript Semantic Highlighting
; Based on Spec.md - Focus on semantic meaning over syntax

; === TypeScript Type System ===

; Built-in TypeScript types
(type_identifier) @type.builtin
  (#any-of? @type.builtin 
    "string" "number" "boolean" "object" "undefined" "null" "void" "never" 
    "unknown" "any" "bigint" "symbol")

; Promise and async types
(type_identifier) @type.builtin
  (#any-of? @type.builtin "Promise" "PromiseLike" "Awaited")

; Collection types
(type_identifier) @type.builtin
  (#any-of? @type.builtin 
    "Array" "ReadonlyArray" "Set" "ReadonlySet" "Map" "ReadonlyMap" 
    "WeakMap" "WeakSet")

; Utility types - these are commonly used and deserve special highlighting
(type_identifier) @type.utility
  (#any-of? @type.utility
    "Partial" "Required" "Readonly" "Record" "Pick" "Omit" "Exclude" 
    "Extract" "NonNullable" "Parameters" "ReturnType" "InstanceType"
    "ThisParameterType" "OmitThisParameter" "ThisType" "Uppercase" 
    "Lowercase" "Capitalize" "Uncapitalize")

; Props and State type patterns - common React patterns
(type_identifier) @type.props
  (#match? @type.props "Props$")

(type_identifier) @type.state  
  (#match? @type.state "State$")

; Generic type parameters
(type_parameter
  name: (type_identifier) @type.generic)

; === Interface and Type Definitions ===

; Interface declarations
(interface_declaration
  name: (type_identifier) @type.definition)

; Type alias declarations  
(type_alias_declaration
  name: (type_identifier) @type.definition)

; Enum declarations
(enum_declaration
  name: (identifier) @type.definition)

; === TypeScript Keywords and Modifiers ===

; Access modifiers
(accessibility_modifier) @keyword.modifier

; Type assertion keywords
(as_expression "as" @keyword.type)

; === Decorators ===

; Decorator symbol
(decorator "@" @symbol)

; Decorator functions
(decorator 
  (identifier) @function.decorator)

(decorator
  (call_expression
    function: (identifier) @function.decorator))

; === Namespace and Module System ===

(namespace_declaration "namespace" @keyword.import)

; Type-only imports/exports
(import_statement "type" @keyword.import)
(export_statement "type" @keyword.export)

; === Operators ===

; Optional chaining and nullish coalescing
"?." @operator.optional
"??" @operator.nullish
"!" @operator.assertion
"?" @operator.conditional

; Type operators
(union_type "|" @operator.type)
(intersection_type "&" @operator.type)
(conditional_type "extends" @keyword.operator)
(conditional_type "?" @operator.conditional ":" @operator.conditional)

; === Function and Arrow Types ===

(function_type "=>" @operator.arrow)

; === Template Literal Types ===

(template_literal_type) @string.template

; === Comments with Special Meaning ===

; JSDoc and TypeScript triple-slash directives
(comment) @comment.documentation
  (#match? @comment.documentation "^(///|/\\*\\*)")

; === Enum Values ===

(enum_body
  (property_identifier) @constant.enum)