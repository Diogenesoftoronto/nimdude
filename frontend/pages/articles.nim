import karax / [vdom, karaxdsl]

proc articles*(): VNode = 
    result = buildHtml(article):
        p: text "I am the articles now"