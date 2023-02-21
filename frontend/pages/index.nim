import karax/[vdom, karaxdsl]

proc index*(): VNode = 
    result = buildHtml(article):
        p: text "I am the index now"