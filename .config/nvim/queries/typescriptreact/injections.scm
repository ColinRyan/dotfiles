(
 ((comment) @lang
            (template_string) @injection.content
            (#eq? @lang "/*GraphQL*/")
            (#offset! @injection.content 0 1 0 -1)
            (#set! injection.include-children)
            (#set!  injection.language  "graphql"))
)

