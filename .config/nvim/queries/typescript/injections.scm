; (
;   ;; Match a call_expression that calls 'gql'
;   (call_expression
;     function: ((identifier) @function-name
;                             (#eq? @function-name "gql"))
;     arguments: ((comment) (template_string) @graphql)
;     (#set! "injection.language" "graphql")

;     )
;   )
;   ;; Ensure the function name is 'gql'
;   ;; Mark the content of the template_string as GraphQL
; )
(
 ((comment) @lang
            (template_string) @injection.content
            (#eq? @lang "/*GraphQL*/")
            (#offset! @injection.content 0 1 0 -1)
            (#set! injection.include-children)
            (#set!  injection.language  "graphql"))
)

