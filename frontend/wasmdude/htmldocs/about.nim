include karax / prelude

proc createDom(): VNode =
  result = buildHtml:
    #  This file is generated by Nim.
    html(lang = "en", xml:lang = "en", xmlns = "http://www.w3.org/1999/xhtml"):
      head:
        meta(content = "text/html; charset=utf-8", http-equiv = "Content-Type")
        meta(content = "width=device-width, initial-scale=1.0", name = "viewport")
        # Favicon
        link(rel = "shortcut icon", href = "data:image/x-icon;base64,AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AAAAAAUAAAAF////AP///wD///8A////AP///wD///8A////AP///wD///8A////AAAAAAIAAABbAAAAlQAAAKIAAACbAAAAmwAAAKIAAACVAAAAWwAAAAL///8A////AP///wD///8A////AAAAABQAAADAAAAAYwAAAA3///8A////AP///wD///8AAAAADQAAAGMAAADAAAAAFP///wD///8A////AP///wAAAACdAAAAOv///wD///8A////AP///wD///8A////AP///wD///8AAAAAOgAAAJ3///8A////AP///wAAAAAnAAAAcP///wAAAAAoAAAASv///wD///8A////AP///wAAAABKAAAAKP///wAAAABwAAAAJ////wD///8AAAAAgQAAABwAAACIAAAAkAAAAJMAAACtAAAAFQAAABUAAACtAAAAkwAAAJAAAACIAAAAHAAAAIH///8A////AAAAAKQAAACrAAAAaP///wD///8AAAAARQAAANIAAADSAAAARf///wD///8AAAAAaAAAAKsAAACk////AAAAADMAAACcAAAAnQAAABj///8A////AP///wAAAAAYAAAAGP///wD///8A////AAAAABgAAACdAAAAnAAAADMAAAB1AAAAwwAAAP8AAADpAAAAsQAAAE4AAAAb////AP///wAAAAAbAAAATgAAALEAAADpAAAA/wAAAMMAAAB1AAAAtwAAAOkAAAD/AAAA/wAAAP8AAADvAAAA3gAAAN4AAADeAAAA3gAAAO8AAAD/AAAA/wAAAP8AAADpAAAAtwAAAGUAAAA/AAAA3wAAAP8AAAD/AAAA/wAAAP8AAAD/AAAA/wAAAP8AAAD/AAAA/wAAAP8AAADfAAAAPwAAAGX///8A////AAAAAEgAAADtAAAAvwAAAL0AAADGAAAA7wAAAO8AAADGAAAAvQAAAL8AAADtAAAASP///wD///8A////AP///wD///8AAAAAO////wD///8A////AAAAAIcAAACH////AP///wD///8AAAAAO////wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A//8AAP//AAD4HwAA7/cAAN/7AAD//wAAoYUAAJ55AACf+QAAh+EAAAAAAADAAwAA4AcAAP5/AAD//wAA//8AAA==")
        link(sizes = "32x32", `type` = "image/png", rel = "icon", href = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA3XAAAN1wFCKJt4AAAAB3RJTUUH4QQQEwksSS9ZWwAAAk1JREFUWMPtll2ITVEUx39nn/O7Y5qR8f05wtCUUr6ZIS++8pEnkZInPImneaCQ5METNdOkeFBKUhMPRIkHKfEuUZSUlGlKPN2TrgfncpvmnntnmlEyq1Z7t89/rf9a6+y99oZxGZf/XeIq61EdtgKXgdXA0xrYAvBjOIF1AI9zvjcC74BSpndrJPkBWDScTF8Aa4E3wDlgHbASaANmVqlcCnwHvgDvgVfAJ+AikAAvgfVZwLnSVZHZaOuKoQi3ZOMi4NkYkpe1p4J7A8BpYAD49hfIy/oqG0+hLomiKP2L5L+1ubn5115S+3OAn4EnwBlgMzCjyt6ZAnQCJ4A7wOs88iRJHvw50HoujuPBoCKwHWiosy8MdfZnAdcHk8dxXFJ3VQbQlCTJvRBCGdRbD4M6uc5glpY3eAihpN5S5w12diSEcCCEcKUO4ljdr15T76ur1FDDLIQQ3qv71EdDOe3Kxj3leRXyk+pxdWnFWod6Wt2bY3de3aSuUHcPBVimHs7mK9WrmeOF6lR1o9qnzskh2ar2qm1qizpfXaPeVGdlmGN5pb09qMxz1Xb1kLqgzn1RyH7JUXW52lr5e/Kqi9qpto7V1atuUzfnARrV7jEib1T76gG2qxdGmXyiekkt1GswPTtek0aBfJp6YySGBfWg2tPQ0FAYgf1stUfdmdcjarbYJEniKIq6gY/Aw+zWHAC+p2labGpqiorFYgGYCEzN7oQdQClN07O1/EfDyGgC0ALMBdYAi4FyK+4H3gLPsxfR1zRNi+NP7nH5J+QntnXe5B5mpfQAAAAASUVORK5CYII=")
        # Google fonts
        link(`type` = "text/css", rel = "stylesheet", href = "https://fonts.googleapis.com/css?family=Lato:400,600,900")
        link(`type` = "text/css", rel = "stylesheet", href = "https://fonts.googleapis.com/css?family=Source+Code+Pro:400,500,600")
        # CSS
        title:
          text "wasmdude/about"
        link(`type` = "text/css", rel = "stylesheet", href = "nimdoc.out.css")
        script(src = "dochack.js", `type` = "text/javascript")
        script(`type` = "text/javascript"):
          text """
function main() {
  var pragmaDots = document.getElementsByClassName("pragmadots");
  for (var i = 0; i < pragmaDots.length; i++) {
    pragmaDots[i].onclick = function(event) {
      // Hide tease
      event.target.parentNode.style.display = "none";
      // Show actual
      event.target.parentNode.nextElementSibling.style.display = "inline";
    }
  }

  function switchTheme(e) {
      if (e.target.checked) {
          document.documentElement.setAttribute('data-theme', 'dark');
          localStorage.setItem('theme', 'dark');
      } else {
          document.documentElement.setAttribute('data-theme', 'light');
          localStorage.setItem('theme', 'light');
      }
  }

  const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');
  if (toggleSwitch !== null) {
    toggleSwitch.addEventListener('change', switchTheme, false);
  }

  var currentTheme = localStorage.getItem('theme');
  if (!currentTheme && window.matchMedia('(prefers-color-scheme: dark)').matches) {
    currentTheme = 'dark';
  }
  if (currentTheme) {
    document.documentElement.setAttribute('data-theme', currentTheme);

    if (currentTheme === 'dark' && toggleSwitch !== null) {
      toggleSwitch.checked = true;
    }
  }
}

window.addEventListener('DOMContentLoaded', main);
"""
      body:
        tdiv(class = "document", id = "documentId"):
          tdiv(class = "container"):
            h1(class = "title"):
              text "wasmdude/about"
            h1(id = "about-me"):
              text "About Me"
            dl(class = "docutils"):
              dt:
                text "Introductions are "
                em:
                  text "hard"
                text ". Here is a short one:"
              dd:
                p:
                  text """
I am dio, a PoC software maker and enby (planning to write a whole thing about
that soon that no one will read) based in a small Canadian town. I love all
things tech, from contributing to FOSS projects to exploring the world of data
science."""
                p:
                  text """
I also love posting about any philosophy papers. I am post-anarchist adjacent
politically 🏴. If you know what that means (because I don't), that's awesome."""
                p:
                  text """
When I'm not coding, you can usually find me lost in virtual reality, tinkering
with Unity or experimenting with 3D printing. I am sure you and the dozens of
other similarly politically inclined would be happy for me to tag along in one
of your reading groups. So if you're looking for someone to geek out with about
tech or philosophy, feel free to reach out!"""
            p:
              text "Here are some "
              em:
                text "Rapid-Fire"
              text " facts about me:"
            ul(class = "simple"):
              li:
                text "🔭 I’m currently working on my "
                strong:
                  text """
A personal portfolio, a blog, a mulitiplayer game called tichu, and an app
called Write and Tell (many more)."""
              li:
                text "🌱 I’m currently learning "
                a(class = "reference external", href = "https://temporal.io/"):
                  text "Temporal"
                text " , Go, and Unity for XR."
              li:
                text "👯 I’m looking to collaborate on "
                strong:
                  text "OpenSource Projects"
                text ", specifically those that are "
                strong:
                  text "futurist, philosophical, or political."
              li:
                text "📫 You can reach me by "
                a(class = "reference external", href = ""):
                  text "email"
                text "."
              li:
                dl(class = "docutils"):
                  dt:
                    text "⚡ About Me :"
                  dd:
                    ul(class = "simple"):
                      li:
                        text "Super observer. 👀"
                      li:
                        text "Super Fast Learner. 🎓"
                      li:
                        text "Wanna-be Piano-forte maestro. 🎹"
                      li:
                        text "I am trying to improve my art skills with "
                        a(class = "reference external", href = "http://www.drawabox.com"):
                          text "drawabox"
                        text ". 🎭"
                      li:
                        text "I love cats, I've got a golden ragtail and two twins. 🐱"
                      li:
                        text """
I am primarily interested in Philosophical and Futurist discussions. Helps me
cope with anxiety. 😅"""
                      li:
                        text "Reading every available webnovel on "
                        a(class = "reference external", href = "https://www.royalroad.com"):
                          text "royalroad"
                        text " . 😉"
                      li:
                        text "I am a huge fan of "
                        a(class = "reference external", href = "https://www.goodreads.com/book/show/29579.Foundation"):
                          text "Foundation"
                        text " . 🚀"
            tdiv(class = "row"):
              tdiv(class = "twelve-columns footer"):
                span(class = "nim-sprite")
                br()
                small(style = "color: var(--hint);".toCss):
                  text "Made with Nim. Generated: 2023-02-20 09:22:02 UTC"

setRenderer createDom