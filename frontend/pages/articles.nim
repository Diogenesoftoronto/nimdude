import karax / [vdom, karaxdsl]
import std/options
import ../components/article

var articles = ["""<h1>OSS Made Me a Better Developer</h1>

<p>Switching to Linux and using OSS made me a better developer. Before I go on to explain why, let me first say that I think of myself as more of a pragmatic person who takes more nuance and balanced views on software. That being said, I do think that calling one self a pragmatist is often just a meaningless phrase for saying that my balance is the right one. Basically, using open source should depend on your use case and I believe that you don&rsquo;t need to use open source to be a good developer or that you should always use open source. However, I do think that there are many reason that developers especially should be using a lot more open source software than they currently do. Also, a bit of a warning, I give a lot of retrospective. This is a bit of a story about my journey and how I got to where I am now. Be prepared for meandering its part of the fun.</p>

<h2>Why I switched to Linux</h2>

<p>My first introduction to Linux was with my father who when I was very young introduced me to Ubuntu and taught me how to install it sometime during my middle school years. I remember that I was not very outwardly excited to put Ubuntu on it but I was interested in running it. And technically, that was not my truly first introduction which was actually Android. However, I am not going to count this as it isn&rsquo;t a desktop operating system. Back to the story, My father showed me how to install an ISO using a USB drive and mount it using Rufus. That was my first introduction to Ubuntu. I don&rsquo;t remember the year but it was probably about 2013 or so. Maybe a bit before or after. I wanted to use Ubuntu because I did not really like Windows 8 and I wanted to upgrade to using something else.</p>

<p>I did not really understand that much about software at the time it was mostly just a desire out of curiousity for something else in user space and this initial experience made me more confident that I could customize my computer to a degree I had not experienced on windows and gave me more confidence to install custom software on my phone.</p>

<p>I did not really use Linux for a long time after that first experience. I did not really have too much of a reason to use after the release of windows 10 when I got my new computer. This lends me to the current view point I have: That windows is probably good enough on the user side. There just aren&rsquo;t that many compelling reason for many user to switch to Linux on the desktop right now. You may disagree with me. Please do, I love to argue. Send me a message on Mastodon or something. Link is in the footer.</p>

<h3>Why I eventually stuck with Linux</h3>

<p>Now, my initial switch to Linux was not a really compelling reason to switch. It was more of an anecdote to why I had choosen to switch at the time and It was really meant to illustrate a contrasting experience I had when I entered the developer space.</p>

<p>I had dual booted Ubuntu on my machine once I finally built my own computer for the first time. At the time it was the cost of purchasing Windows that held me back along with the fact I could get most things running on Ubuntu. This was in 2018. I had finally got enough money from a job building hospital doors at some furniture company. Along with willing to shoulder a bit of credit card debt. It was a pretty nice machine. I had a ryzen 2700x, 16gb of ddr4 ram, 500gb nvme drive (those were expensive then). And a brand new radeon 5700 (I could not afford the xt). Hindsight I bought in just about the right time since the whole pandemic thing would happen in two years driving GPUs and the rest sky high. I could finally play Overwatch. Yes, it was basically not cool to play by then. And most people had abandoned playing it by the time that I started. But I had shit tons of fun playing it with friends regardless. And I didn&rsquo;t experience any of the toxicity&hellip; Because my microphone and headphones didn&rsquo;t work with it 🤣. What may appear first as a curse is a blessing. The only people that I could talk to was friends playing with me on Discord.</p>

<p>After fooling around for about a year and half, I decided I wanted to get serious about learning to program sometime in late 2019(I had casually done programming and development when I was younger and done some beginner courses with it but never decided yeah I want this as a career). And oh boy, did I get the time. As we all know what was about to happen soon. About one year after teaching myself a few things with python and doing some light development in Java. I stumbled upon a Bootcamp scholarship. It was here that they <em>required</em> you to use Linux. I had to use Ubuntu. I had to use Vagrant. I had to use the terminal. I had to use git. While I had use git a bit before I never really got used to programming so often daily. I never got used to using the terminal so frequently.</p>

<p>Using these frequently did wonders to the rate that I improved as a developer. The key to it was other people that I was invovled with using similar tools or the same. Sometime during the end of the camp I had switched to using windows with WSL and I just had loads of annoyances. Powershell felt just so much more clunky than bash or fish. And being forced to use WSL for some application and the same apps not working with my regular cmd or powershell was just frustrating. On Linux, my developers tools&hellip; well they just worked. On Windows they had a thousand workarounds, older versions of packages. And configuring your path was a nightmare. I did learn things that helped me work through this on windows but it just never felt as smooth as on Linux. The open source community had largely developed open source software for other open source software. Go figure.</p>

<p>I decided that If I was starting to use WSL for almost everything I might as well just use Linux. I had been using Linux for a while and I had been using it for development. I had been using it for my personal projects. I had been using it for my work. It was time to switch. This time maybe for good. I had heard that Linux gaming had vastly improved since the launch of the Steamdeck. So I didn&rsquo;t have that many reasons to stay on windows. But really what finally made me switch was just the amount of memory programs seemed to take on idle in windows. My computer just didn&rsquo;t feel even close to as snappy as it did on Linux. My first few days after I got my new software engineering job, my computer was basically unusable. So I made the switch.</p>

<h2>Enough about Linux, what about other open source software?</h2>

<p>Yeah this really isn&rsquo;t just a post about how using Linux made me a better developer, it is about how open source software as a whole did and continues to do so. So let&rsquo;s talk more about that. I think some of key things to pay attention to in the story I was telling you is that a lot of open source software tends to work better with other software that is also open source. This really should not be such a surprise but you don&rsquo;t really get it till you get it. Ya know? You have to live it to realize it. Or maybe I could do some data analysis instead of giving vaguaries. Nah, that&rsquo;s a project for another time.</p>

<p>I think the key to this is that open source software is developed by people who are passionate about the software. They are not trying to make a quick buck off of you. They are not trying to make a quick buck off of your data. And all that bleeds into the software. Kind of like the difference between a home cooked meal and one from a restaurant. The restaurant is trying to make a quick buck. The home cooked meal is made with love. And you can taste the difference. Or maybe in a less cheesy way, a home cooked meal is made for you and people like you. You can cater to their needs specifically without worrying about whether others will like it and if you are sharing it for the community in a pot luck you can get tips and tricks on how to make it better much faster. Oh and people can bring things that compliment the meal you brought.</p>

<p>As analogies only go so far I think it is time to put this one to rest. You can think of using open source software as a way into a close community of developers. They can help you in more ways then just fixing bugs. They can help you with your career. They can help you with your personal projects. I think that is more important than almost any other reason to use open source. While you can find these things else where they are just so accessable if you are looking for help as a developer in Open source communities.</p>

<h2>Developing for open source made me a better developer</h2>

<p>Being involved in the open source community lends you the confidence that you too can change and add value to people&rsquo;s lives through software. It also gives you a lot of examples about how to create a project in general. For example, I learned a ton about licensing and software law because of open source. The difference between a Mozilla Public license versus a Affero Gnu Public License or a MIT versus a Apache License. It taught me how to explain what I am building and creating to other engineers and non-engineers in a clear and concise way. It made it easy to make habits for making sure my code was readable so that when someone wanted to contribute to the source code they could more easily understand it. I also learned how to write documentation. How to create a roadmap of features. I learned why you really want to limit dependencies or the size of your binaries. When you are developing open source you are expected to be maintaining it. So sustainable choices become much more important to you.</p>

<p>You also learn the benefit of testing and Continuous Integration as each pull request is tested and reviewed by other developers. Because the open source community is very much in favour of feedback and the sharing of code to make software just better, it gave me a lot of practice in receiving and giving feedback and code reviews. Something that many developers dread outside the open source community. It was exciting in the community because only people interested in making your project better would usually take the time to give you that feedback. And you would be able to see the improvements that they made to your project. It is a great way to learn and grow quickly as a developer.</p>

<p>When I compare myself to my peers who did not get invovled in open source I see this very large gap in these types of skills. They are not bad developers. They just don&rsquo;t tend to practice these sorts of skills as much. I think that this is a shame because these skills are much more closely linked to what you will be doing in your career as a developer, especially when you will be creating your own projects and businesses. I think that open source really is one of the best ways to get experience and practice in software engineering.</p>

<p>As a developer, I know firsthand the value of open source software. It&rsquo;s allowed me to learn from other developers' code, contribute to existing projects, and create my own applications without reinventing the wheel. Open source has empowered developers like me to innovate, collaborate, and make the world a better place through technology.</p>

<p>While Linux is undoubtedly a significant part of the open source ecosystem, it&rsquo;s important to remember that open source is much more than just one operating system. From web frameworks to databases to machine learning libraries, open source powers a vast array of tools that developers rely on every day. By contributing to and using open source software, developers can harness the collective power of the community to create better, more reliable software.</p>

<p>I believe that the future of software development lies in open source. As more and more developers recognize the benefits of open collaboration, we&rsquo;ll see even more incredible innovations emerge from the open source community. Whether you&rsquo;re a seasoned developer or just starting out, I encourage you to get involved in open source projects and experience the power of collaborative software development for yourself.</p>

<h2>Conclusion</h2>

<p>Open source is not just a buzzword or a trend in the tech industry. It represents a fundamental shift in the way we create and share software. By leveraging the power of collaborative development and community-driven innovation, open source has revolutionized the software industry and empowered developers to build amazing products that are accessible to everyone.</p>

<p>As a developer, embracing open source is not just a matter of ideology, but also a practical decision that can benefit your career and your skills. Contributing to open source projects can help you sharpen your coding skills, build your reputation and network, and gain experience with cutting-edge technologies.</p>

<p>Of course, open source is not without its challenges and drawbacks. It really requires you to engage with a community of other developers and forces more transparent processes. You really may struggle from getting feedback. You may also struggle gaining funding and support even when your project is so important to so many people. However, these challenges are far outweighed by the benefits that open source can offer, both for individual developers and for the software industry as a whole.</p>

<p>In short, if you&rsquo;re a developer who wants to make a difference and contribute to the wider community, open source is the way to go. By working together with like-minded developers, you can create amazing software that has the potential to change the world. So go ahead, join an open source project today, and experience the power of collaborative development for yourself!</p>

<p><code>If you are interested in learing more about my experience with open source software and how it has helped me become a better developer, I plan on writing a second part to this going into specific examples. Remember that I love to get feedback. So if you have any further questions or comments please feel free to reach out. Links in the footer</code></p>"""]

proc Articles*(): VNode = 
    result = buildHtml(tdiv(class="container")):
        for _, article in articles:
            article.Article.get
