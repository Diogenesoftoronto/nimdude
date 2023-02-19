import karax / [vdom, karaxdsl]
import ../helpers

# components have behavior and render method
# create an object with github data
type
   Githost* = object # example of a final object
    name*: string
    repos*: seq[string]
    stars*: int
    commits*: int
  
# proc updateHosts(host: Githost): HttpRequest =
#     result = 
#         ajaxGet(
#             "https://raw.githubusercontent.com/nim-lang/packages/master/packages.json", 
#             @[], 
#             proc (status: int, response: cstring) =
#                 if status == 200:
#                     let json = parse(response)
#                     for repo in json.repos:
#                         host.repos.add(repo.name)
#                         host.stars += repo.stars
#                         host.commits += repo.commits
#         )

proc hostStats(host: Githost): VNode =
    result = buildHtml(tdiv):
        tr:
            th: text strConv(host.name, "⛩️")
        tr:
            th: text "Repos 📚"
            th: text "Stars 🌟"
            th: text "Commits 🖊️"
        tr:
            td: text strConv(host.repos)
            td: text $host.stars
            td: text $host.commits

proc stats*(hosts: varargs[Githost]): VNode =
    result = buildHtml(tdiv):
        for host in hosts:
            table:
                hostStats(host)

