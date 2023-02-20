import karax / [vdom, karaxdsl]

const f = """
<div class="document" id="documentId">
  <div class="container">
    <h1 class="title">wasmdude/about</h1>
    
<h1 id="about-me">About Me</h1><dl class="docutils"><dt>Introductions are <em>hard</em>. Here is a short one:</dt>
<dd><p>I am dio, a PoC software maker and enby (planning to write a whole thing about that soon that no one will read) based in a small Canadian town. I love all things tech, from contributing to FOSS projects to exploring the world of data science.</p>
<p>I also love posting about any philosophy papers. I am post-anarchist adjacent politically 🏴. If you know what that means (because I don't), that's awesome.</p>
<p>When I'm not coding, you can usually find me lost in virtual reality, tinkering with Unity or experimenting with 3D printing. I am sure you and the dozens of other similarly politically inclined would be happy for me to tag along in one of your reading groups. So if you're looking for someone to geek out with about tech or philosophy, feel free to reach out!</p>
</dd>
</dl>
<p>Here are some <em>Rapid-Fire</em> facts about me:</p>
<ul class="simple"><li>🔭 I’m currently working on my <strong>A personal portfolio, a blog, a mulitiplayer game called tichu, and an app called Write and Tell (many more).</strong></li>
<li>🌱 I’m currently learning <a class="reference external" href="https://temporal.io/">Temporal</a> , Go, and Unity for XR.</li>
<li>👯 I’m looking to collaborate on <strong>OpenSource Projects</strong>, specifically those that are <strong>futurist, philosophical, or political.</strong></li>
<li>📫 You can reach me by <a class="reference external" href="">email</a>.</li>
<li><dl class="docutils"><dt>⚡ About Me :</dt>
<dd><ul class="simple"><li>Super observer. 👀</li>
<li>Super Fast Learner. 🎓</li>
<li>Wanna-be Piano-forte maestro. 🎹</li>
<li>I am trying to improve my art skills with <a class="reference external" href="http://www.drawabox.com">drawabox</a>. 🎭</li>
<li>I love cats, I've got a golden ragtail and two twins. 🐱</li>
<li>I am primarily interested in Philosophical and Futurist discussions. Helps me cope with anxiety. 😅</li>
<li>Reading every available webnovel on <a class="reference external" href="https://www.royalroad.com">royalroad</a> . 😉</li>
<li>I am a huge fan of <a class="reference external" href="https://www.goodreads.com/book/show/29579.Foundation">Foundation</a> . 🚀</li>
</ul>
</dd>
</dl>
</li>
</ul>



    <div class="row">
      <div class="twelve-columns footer">
        <span class="nim-sprite"></span>
        <br/>
        <small style="color: var(--hint);">Made with Nim. Generated: 2023-02-20 09:21:19 UTC</small>
      </div>
    </div>
  </div>
</div>
"""

proc about*(): VNode = 
    result = buildHtml(tdiv):
        verbatim(f)