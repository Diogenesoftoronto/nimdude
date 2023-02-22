import karax / [vdom, karaxdsl]
import strutils
import ../constants


const Countries = CountriesRaw.splitLines()

proc contact*(): VNode = 
    result = buildHtml(tdiv(class="container")):
        form(`method`="POST", action="/contact"):
            tdiv:
                tdiv:
                    label(`for`="firstname") 
                    text "First Name"
                tdiv:
                    input(`type`="text", id="fname", name="firstname", placeholder="Your name..")
            tdiv:
                tdiv:
                    label(`for`="lastname"): 
                        text "Last Name"
                tdiv:
                    input(`type`="text", id="lname", name="lastname", placeholder="Your last name..")
            tdiv:
                tdiv:
                    label(`for`="country"):
                        text "Country"
                tdiv:
                    select(id="country", name="country"):
                        for country in Countries:
                            option(value=country):
                                    text country
            # email address
            tdiv:
                tdiv:
                    label(`for`="email"):
                        text "Email"
                tdiv:
                    input(`type`="email", id="email", name="email", placeholder="Your email..")
            # company
            tdiv:
                tdiv:
                    label(`for`="company"):
                        text "Company"
                tdiv:
                    input(`type`="text", id="company", name="company", placeholder="Your company..")
            tdiv:
                tdiv:
                    label(`for`="subject"): 
                        text "Subject"
                tdiv:
                    textarea(id="subject", name="subject", placeholder="Write something..")
            tdiv:
                button(`type`="submit"):
                    text "Submit"