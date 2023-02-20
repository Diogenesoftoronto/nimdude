import karax/[karaxdsl, vdom]

var Media = ["mastodon", "github", "linkedin", "youtube", "reddit", "patreon"]

proc makeFooter*(): VNode =
    result = buildHtml(tdiv):
        for medium in Media:
            a(href = medium, class = "footer-link")
            img(src = "static/" & medium & ".svg", class = "footer-img")
        tdiv(class = "footer-text center"):
          p:  text "© 2020 - 2021"