import karax / [karax, karaxdsl, vdom]

var Routes = ["index", "about", "contact", "projects", "stats", "articles"]

proc makeNavigation*(data: RouterData): VNode =
    result = buildHtml(tdiv):
        for route in Routes:
            a(class="nav-link", href= "#/"&route):
                span(class= "nav-link-inner-text"):
                    text route
            # let
            #     route = routes.route
            #     name = routes.name
            #     active = data.route == route
            # tdiv:
            #     class = "nav-item"
            #     if active:
            #         class = "nav-item active"
            #     tdiv:
            #         class = "nav-link"
            #         tspan:
            #             class = "nav-link-inner-text"
            #             text = name
            #         onclick = proc (e: Event) =
            #             e.preventDefault()
            #             data.router.push(route)