import karax / [vdom, karaxdsl]

proc about*(): VNode = 
    result = buildHtml(tdiv):
        p: text "I am the about now"