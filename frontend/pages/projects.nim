# Projects tell a story about what I am building and why
# When showcasing my work, presentation is the central theme
# The key point is to demonstrate my skills and ambition

import karax / [vdom, karaxdsl]

proc projects*(): VNode = 
    result = buildHtml(article):
        p: text "I am the projects now"