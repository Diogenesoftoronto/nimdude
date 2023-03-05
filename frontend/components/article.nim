import std/options
import karax/[vdom]


proc Article*(article: string): Option[VNode] =
  try:
    result = article.verbatim.some
  except IOError:
    result = VNode.none



