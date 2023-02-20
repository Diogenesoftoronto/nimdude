import karax / [karax, karaxdsl, vdom]
# import strutils
# type Routes = enum index, about, contact, projects, stats, articles
var Routes = ["index", "about", "contact", "projects", "stats", "articles"]

proc makeNavigation*(data: RouterData): VNode =
    result = buildHtml(tdiv):
        # var currentroute = $data.hashPart
        # currentroute = currentroute[1..currentroute.len]
        for route in Routes:
            # var style: string
            # if currentroute == route:
            #     style = "active"
            # else:
            #     style = ""
            a(class="nav-link", href="#/"&route):
                span(class="nav-item"):
                        text route
# import karax / [karax, karaxdsl, vdom]


# proc makeNavigation*(data: RouterData): VNode =
#     result = buildHtml(tdiv):
#         for route in Routes:
#             a(class="nav-link", href= "#/"&route):
#                 span(class= "nav-link-inner-text"):
#                     text route