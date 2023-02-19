include karax / prelude
import pages / [index, articles, about, contact, projects, stats]


type
  Show = enum
    index, articles, about, contact, projects, stats
var show: Show

proc createDom(data: RouterData): VNode =
  if data.hashPart == "#/": show = index
  elif data.hashPart == "#/articles": show = articles
  elif data.hashPart == "#/about": show = about
  elif data.hashPart == "#/contact": show = contact
  elif data.hashPart == "#/projects": show = projects
  elif data.hashPart == "#/github-stats": show = stats
  
  result = buildHtml(tdiv(class="portfolio-wrapper")):
    head(class = "")
    section(class = "portfolio"):
      makeNavigation(data)
      let route = case show:
        of index: index()
        of articles: articles()
        of about: about()
        of contact: contact()
        of projects: projects()
        of stats: Stats()
        route()
      makeFooter()
setRenderer createDom
