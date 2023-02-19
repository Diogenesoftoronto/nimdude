import karax / [vdom, karaxdsl]

proc articles*(): VNode = 
    result = buildHtml(tdiv):
        p: text "I am the articles now"