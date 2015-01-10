
$(document).ready( () ->

    args = {}
    paramsStr = window.location.href.slice(window.location.href.indexOf('?')+1);
    if paramsStr?
        params = paramsStr.split('&')

        params.forEach( (p) ->
            parts = p.split('=')
            args[parts[0]] = parts[1]
        )

    if args.file?
        $.get(
            args.file,
            (data) ->
                $("#code").text(data)
                SyntaxHighlighter.highlight( $("#code") );
        )
)


