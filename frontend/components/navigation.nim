import karax / [karax, karaxdsl, vdom]
import std/strutils

import ../constants

proc makeNavigation*(data: RouterData): VNode =
    result = buildHtml(nav(class="container-fluid")):
            ul:
                li:
                    a(class="primary", href="#/"):
                            strong(class="lg-text"):
                                text "Nimdude"
            ul:
                for route in Routes:
                        li:
                            a(class="secondary", href="#/"&route):
                                text route.capitalizeAscii