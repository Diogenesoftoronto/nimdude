import karax/[karax, vdom, karaxdsl]
import router


proc main(data: RouterData): VNode =
    result = Router(data)
setRenderer main
