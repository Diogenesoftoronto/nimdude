import karax / [vdom, karaxdsl]
import strutils

const CountriesRaw = """Afghanistan
Albania
Algeria
Andorra
Angola
Antigua & Deps
Argentina
Armenia
Australia
Austria
Azerbaijan
Bahamas
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bhutan
Bolivia
Bosnia Herzegovina
Botswana
Brazil
Brunei
Bulgaria
Burkina
Burundi
Cambodia
Cameroon
Canada
Cape Verde
Central African Rep
Chad
Chile
China
Colombia
Comoros
Congo
Congo {Democratic Rep}
Costa Rica
Croatia
Cuba
Cyprus
Czech Republic
Denmark
Djibouti
Dominica
Dominican Republic
East Timor
Ecuador
Egypt
El Salvador
Equatorial Guinea
Eritrea
Estonia
Ethiopia
Fiji
Finland
France
Gabon
Gambia
Georgia
Germany
Ghana
Greece
Grenada
Guatemala
Guinea
Guinea-Bissau
Guyana
Haiti
Honduras
Hungary
Iceland
India
Indonesia
Iran
Iraq
Ireland {Republic}
Israel
Italy
Ivory Coast
Jamaica
Japan
Jordan
Kazakhstan
Kenya
Kiribati
Korea North
Korea South
Kosovo
Kuwait
Kyrgyzstan
Laos
Latvia
Lebanon
Lesotho
Liberia
Libya
Liechtenstein
Lithuania
Luxembourg
Macedonia
Madagascar
Malawi
Malaysia
Maldives
Mali
Malta
Marshall Islands
Mauritania
Mauritius
Mexico
Micronesia
Moldova
Monaco
Mongolia
Montenegro
Morocco
Mozambique
Myanmar, {Burma}
Namibia
Nauru
Nepal
Netherlands
New Zealand
Nicaragua
Niger
Nigeria
Norway
Oman
Pakistan
Palau
Panama
Papua New Guinea
Paraguay
Peru
Philippines
Poland
Portugal
Qatar
Romania
Russian Federation
Rwanda
St Kitts & Nevis
St Lucia
Saint Vincent & the Grenadines
Samoa
San Marino
Sao Tome & Principe
Saudi Arabia
Senegal
Serbia
Seychelles
Sierra Leone
Singapore
Slovakia
Slovenia
Solomon Islands
Somalia
South Africa
South Sudan
Spain
Sri Lanka
Sudan
Suriname
Swaziland
Sweden
Switzerland
Syria
Taiwan
Tajikistan
Tanzania
Thailand
Togo
Tonga
Trinidad & Tobago
Tunisia
Turkey
Turkmenistan
Tuvalu
Uganda
Ukraine
United Arab Emirates
United Kingdom
United States
Uruguay
Uzbekistan
Vanuatu
Vatican City
Venezuela
Vietnam
Yemen
Zambia
Zimbabwe"""

const Countries = CountriesRaw.splitLines()

proc contact*(): VNode = 
    result = buildHtml(tdiv(class="container")):
        form:
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
                input(`type`="submit", value="Submit")