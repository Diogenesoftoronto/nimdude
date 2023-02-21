import karax / [vdom, karaxdsl]

proc contact*(): VNode = 
    result = buildHtml(article):
        p: text "I am the contact now"