import karax / [karax, karaxdsl, vdom]
import std/strutils
from sugar import `=>`
import ../constants
import std/options


proc hamMenu*(show: int): Option[VNode] =
    if show == 1:
        var menu = buildHtml(aside(class="container-fluid")):
                    nav:
                        ul:
                            for route in Routes:
                                li:
                                    a(class="secondary", href="#/"&route):
                                        text route.capitalizeAscii
        return some(menu)
    return none(VNode)

proc mobileNavigation*(s: ptr int): VNode =
    result = buildHtml(nav(class="container-fluid")):
        ul:
            li:
                button(onclick = () => (s[] *= -1)):
                    let image = "static/images/hamburger.svg"
                    img(src = image, class = "footer-img"): discard
        ul:
            li:
                a(class="primary", href="/"):
                        strong(class="lg-text"):
                            text "Nimdude"

