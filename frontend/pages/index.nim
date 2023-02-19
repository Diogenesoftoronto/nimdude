import karax/[vdom, karaxdsl]

proc index*(): VNode = 
    result = buildHtml(tdiv):
        p: text "I am the index now"