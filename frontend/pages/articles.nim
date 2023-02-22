import karax / [vdom, karaxdsl]

proc articles*(): VNode = 
    result = buildHtml(tdiv(class="container")):
        p: text "I am the articles now"