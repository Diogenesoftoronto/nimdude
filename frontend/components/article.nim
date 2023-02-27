import std/options
# import std/strutils

import karax/[vdom]
# import shell
# generate an article using the hastyscribe to take articles written in markdown and convert them to html and then into karax code.
# const articleDir = ".."/"wasmdude"/"articles"
# const mdExt = ".md"

# proc compileArticles*(dir, ext: string): bool =
#   try:
#     for dir, file in walkDir(dir):
#       if file.endsWith(ext):
#         let article = file[0 ..< file.len - mdExt.len]
#         shell:
#             pwd
#             cd ($dir)
#             hastyscribe --fragment ($article)
#       return true
#   except OSError, IOError:
#     return false

# when compileArticles(articleDir, mdExt):
proc Article*(article: string): Option[VNode] =
  try:
    result = article.verbatim.some
  except IOError:
    result = VNode.none



