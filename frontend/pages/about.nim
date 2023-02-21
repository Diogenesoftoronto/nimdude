import karax / [vdom, karaxdsl]


proc about*(): VNode = 
    result = buildHtml(article):
        tdiv(class = "container"):
            h1(id = "about-me"):
              text "About Me"
            h2(id = "poetic-introductioncolon"):
              text "Poetic Introduction:"
            blockquote:
              p()
              p:
                text """
I am but a maker in a small Canadian town, Crafting software with rapid-fire,
trying to hold it down. I am post-anarchist adjacent, or so they say, Though
what that means, I cannot truly say."""
              p:
                text """
Each day I strive to learn, to keep my skills on the rise, Temporal, Go, and
Unity, I never compromise. Yet humble must I be, for my journey's just begun, As
the horizon of knowledge is wider than the sun."""
              p:
                text """
Feline friends I cherish, three in number are they, Ever by my side, as I toil
and work and play. And when I need respite, from the toil and grind, I dive into
a litRPGs, or Asimov, to ease my mind."""
              p:
                text """
Portfolios, blogs, and multiplayer games, I have many irons in the fire, And I'm
making an app called Write and Tell, my greatest desire. But fame and fortune do
not move me, nor drive me to excel, For true satisfaction comes from the
difference we make, and the stories we tell."""
              p:
                text """
So raise a glass(of tea), to this humble(the humble never say they are) maker on
thy journey to the stars, With a heart full of hope, and a mind full of scars.
May I make a difference, and play my part aright, For in the end, it's not about
me, it's about making things right."""
            h2(id = "introduction"):
              text "Introduction"
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
                small:
                  text "Made with Nim. Generated: 2023-02-21 20:46:57 UTC"