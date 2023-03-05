import karax / [karax, vdom, karaxdsl]
import pages / [index, articles, about, contact, projects, stats]
import components / [navigation, footer]
import std/options

# data
var 
    Github: stats.Githost
    # Gitlab: stats.Githost
    # Gitea: stats.Githost

Github = Githost(name: "Github", repos: @[], stars: 0, commits: 0)

# types
type
  Show = enum
    rindex, rarticles, rabout, rcontact, rprojects, rstats
var show: Show


var showSideMenu = -1

# functions
proc Router*(data: RouterData): VNode =
  if data.hashPart == "/": show = rindex
  elif data.hashPart == "#/articles": show = rarticles
  elif data.hashPart == "#/about": show = rabout
  elif data.hashPart == "#/contact": show = rcontact
  elif data.hashPart == "#/projects": show = rprojects
  elif data.hashPart == "#/stats": show = rstats
  
  var m = hamMenu(showSideMenu)
  result = buildHtml(tdiv(class="portfolio-wrapper")):
    # add some links to css files
    section(class = "portfolio"):
      mobileNavigation(showSideMenu.addr)
      if isSome(m):
            get(m)
      let route = case show:
        of rindex: index.index()
        of rarticles: articles.Articles()
        of rabout: about.about()
        of rcontact: contact.contact()
        of rprojects: projects.projects()
        of rstats: stats.stats(Github)
      route
      makeFooter()
