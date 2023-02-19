import karax / [vdom, karaxdsl]

proc contact*(): VNode = 
    result = buildHtml(tdiv):
        p: text "I am the contact now"