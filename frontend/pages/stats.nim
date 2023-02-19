import karax / [vdom, karaxdsl, kajax]
import helpers/strConv
# components have behavior and render method
# create an object with github data
type
   Githost = object # example of a final object
    name*: string
    repos*: seq[string]
    stars*: int
    commits*: int
  
proc updateHosts(host: Githost): Githost {.async.} =
    result = ajaxGet(strConv(http://localhost:4001/, host.name, update))


proc hostStats(host: Githost): VNode =
    result = buildHtml(tdiv):
    tr:
        th: text host.name ⛩️
    tr:
        th: text "Repos 📚"
        th: text "Stars 🌟"
        th: text "Commits 🖊️"
    tr:
        td: text host.repos
        td: text host.stars
        td: text host.commits



