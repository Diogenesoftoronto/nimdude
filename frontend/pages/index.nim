import karax/[vdom, karaxdsl]

proc index*(): VNode = 
    result = buildHtml(tdiv(class="container")):
        h2:
            text "Welcome to Nimdude"
        p:
            text "Formerly known as Wasmdude"
        p:
            text """
    Wasmdude is an application made to show off.🧐 This site and all its flaws are my
    complete and total ability. 🙄/s"""
        p:
            text """
    Okay, now to be more serious about this, this site takes most of my writing and
    projects from Github, Discord, etc. and tries to put them in one place that I
    can display it all. I decided that I would finally create a site no matter how
    shitty it actually ends up being and this is the result of that work in a a
    weekend."""
        p:
            text "Continue at your own peril."
        h2:
            text "Latest Article"
        p:
            a(href = "https://diogenesoftoronto.github.io/blog/2020/05/31/why-i-am-post-anarchist-adjacent.html"):
                text "Why I am post-anarchist adjacent"