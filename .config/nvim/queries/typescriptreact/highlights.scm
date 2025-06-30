; TypeScript React Semantic Highlighting  
; Based on Spec.md - Inherits TypeScript highlighting + React/JSX specifics

; === React Hook Classification ===

; State management hooks
(call_expression
  function: (identifier) @function.hook.state
  (#any-of? @function.hook.state "useState" "useReducer"))

; Effect hooks  
(call_expression
  function: (identifier) @function.hook.effect
  (#any-of? @function.hook.effect "useEffect" "useLayoutEffect" "useInsertionEffect"))

; Context hooks
(call_expression
  function: (identifier) @function.hook.context
  (#eq? @function.hook.context "useContext"))

; Reference hooks
(call_expression
  function: (identifier) @function.hook.ref
  (#any-of? @function.hook.ref "useRef" "useImperativeHandle"))

; Memoization hooks
(call_expression
  function: (identifier) @function.hook.memo
  (#any-of? @function.hook.memo "useMemo" "useCallback"))

; Custom hooks - any function starting with 'use' + capital letter
(call_expression
  function: (identifier) @function.hook.custom
  (#match? @function.hook.custom "^use[A-Z]"))

; === JSX Element Classification ===

; HTML elements (lowercase)
(jsx_opening_element
  name: (identifier) @tag.html
  (#match? @tag.html "^[a-z]"))

(jsx_closing_element  
  name: (identifier) @tag.html
  (#match? @tag.html "^[a-z]"))

(jsx_self_closing_element
  name: (identifier) @tag.html
  (#match? @tag.html "^[a-z]"))

; React components (PascalCase)
(jsx_opening_element
  name: (identifier) @tag.component
  (#match? @tag.component "^[A-Z]"))

(jsx_closing_element
  name: (identifier) @tag.component  
  (#match? @tag.component "^[A-Z]"))

(jsx_self_closing_element
  name: (identifier) @tag.component
  (#match? @tag.component "^[A-Z]"))

; Namespaced components (e.g., Lib.Component)
(jsx_opening_element
  name: (member_expression) @tag.component)

(jsx_closing_element
  name: (member_expression) @tag.component)

(jsx_self_closing_element  
  name: (member_expression) @tag.component)

; React Fragments
(jsx_fragment
  "<" @tag.fragment ">" @tag.fragment
  "</" @tag.fragment ">" @tag.fragment)

; === JSX Attribute Categorization ===

; Event handlers (onClick, onChange, etc.)
(jsx_attribute
  name: (property_identifier) @attribute.event
  (#match? @attribute.event "^on[A-Z]"))

; React special attributes
(jsx_attribute
  name: (property_identifier) @attribute.special
  (#any-of? @attribute.special "key" "ref" "className" "htmlFor"))

; Dangerous attributes - should stand out
(jsx_attribute
  name: (property_identifier) @attribute.dangerous
  (#eq? @attribute.dangerous "dangerouslySetInnerHTML"))

; Data and accessibility attributes
(jsx_attribute
  name: (property_identifier) @attribute.data
  (#match? @attribute.data "^(data-|aria-)"))

; Style-related attributes
(jsx_attribute
  name: (property_identifier) @attribute.style
  (#any-of? @attribute.style "style" "className"))

; === React Component Functions ===

; React component functions (PascalCase function names)
(function_declaration
  name: (identifier) @function.component
  (#match? @function.component "^[A-Z]"))

; Arrow function components  
(variable_declarator
  name: (identifier) @function.component
  value: (arrow_function)
  (#match? @function.component "^[A-Z]"))

; Custom hook functions
(function_declaration
  name: (identifier) @function.hook.custom
  (#match? @function.hook.custom "^use[A-Z]"))

; Arrow function hooks
(variable_declarator
  name: (identifier) @function.hook.custom  
  value: (arrow_function)
  (#match? @function.hook.custom "^use[A-Z]"))

; === React API Calls ===

; React.* method calls
(call_expression
  function: (member_expression
    object: (identifier) @module.react
    property: (property_identifier) @function.react)
  (#eq? @module.react "React"))

; Common React functions
(call_expression
  function: (member_expression
    object: (identifier) @_react
    property: (property_identifier) @function.react.special)
  (#eq? @_react "React")
  (#any-of? @function.react.special "forwardRef" "memo" "createElement" "cloneElement"))

; === CSS-in-JS Integration ===

; styled-components - styled.div``, styled(Component)``
(call_expression
  function: (member_expression
    object: (identifier) @module.styled
    property: (property_identifier) @tag.styled)
  arguments: (arguments (template_string) @string.css)
  (#eq? @module.styled "styled"))

; CSS function calls - css``, keyframes``
(call_expression
  function: (identifier) @function.css
  arguments: (arguments (template_string) @string.css)
  (#any-of? @function.css "css" "keyframes" "injectGlobal"))

; CSS prop in JSX
(jsx_attribute
  name: (property_identifier) @attribute.css
  value: (jsx_expression
    (template_string) @string.css)
  (#eq? @attribute.css "css"))

; === Import/Export Semantics ===

; React imports
(import_specifier
  name: (identifier) @import.react
  (#eq? @import.react "React"))

; Hook imports (functions starting with 'use')
(import_specifier
  name: (identifier) @import.hook
  (#match? @import.hook "^use[A-Z]"))

; Component imports (PascalCase)
(import_specifier  
  name: (identifier) @import.component
  (#match? @import.component "^[A-Z]"))

; === JSX Content ===

; JSX text content
(jsx_text) @text.jsx

; JSX expression containers
(jsx_expression
  "{" @punctuation.bracket.jsx
  "}" @punctuation.bracket.jsx)

; JSX attribute values
(jsx_attribute
  value: (string) @string.jsx)

; === React Type Patterns ===

; React built-in types
(type_identifier) @type.react
  (#any-of? @type.react
    "ReactNode" "ReactElement" "ReactComponent" "ComponentType" "FC" 
    "FunctionComponent" "Component" "PureComponent" "RefObject" 
    "MutableRefObject" "PropsWithChildren" "ComponentProps")