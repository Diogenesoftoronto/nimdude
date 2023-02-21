import karax/[karaxdsl, vdom]

type Media = tuple[site: string, url: string]

var media: seq[Media] 

media = @[
        ("mastodon", "https://mastodon.online/@dio"),
        ("github", "https://github.com/Diogenesoftoronto/"),
        ("linkedin", "https://www.linkedin.com/in/keith-noel-a06092a1/"),
        ("youtube", "https://youtube.com/@KManAbout"),
        ("reddit", "https://www.reddit.com/user/Obnoxious_pedant"),
        ("patreon", "https://www.patreon.com/dio_of_6")
    ]

proc makeFooter*(): VNode =
    result = buildHtml(footer):
            nav(class = "container"):
                for medium in media:
                    let image = "static/images/"&medium.site&".svg"
                    a(href = medium.url, class = "footer-link", aria-label="breadcrumb"):
                        img(src = image, class = "footer-img"): discard            
            tdiv(class = "container"):
                hr: discard
                p: 
                    text "This site is licensed under the "
                    a(class = "reference external", href = "https://www.mozilla.org/en-US/MPL/2.0/"):
                        text "Mozilla Public License "
                    text " You can find the source code "
                    a(class = "reference external", href = "https://github.com/Diogenesoftoronto/nimdude"):
                        text "here."