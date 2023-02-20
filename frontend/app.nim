import karax/[karax, vdom]
import router


proc app(data: RouterData): VNode =
    result = Router(data)
setRenderer app
