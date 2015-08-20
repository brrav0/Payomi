== README

To do:
1) deploy latest version on Heroku
2) test live within close circles
3) enhance testing
4) test the scheduler / rake for schedule-add ons on heroku
5) see change in client and presentation (see simple form and organization of navigation)
6) Ajax #240 search pagination
7) Client side validation #263
8) Active admin #283
9) Back-up of database
10) Extension of dashboard similar that auditor for client and bank
11) Leave to the client the option not to sign the requested confirmation and add additional information including the auditor in the table + beef up the email
12) Change the icon for the user
13) Leave the option for the bank to see the final report as well so they can know what they confirmed
14) refactor the action_depend_on_status thing to get something more robust and potentially testable
15) bug if a second client is created I have the same client with 2 ids - the contact client get the first id and miss the other as a result a ssystem should be put in place so that two client.email can not be entered twice (e.g. loreal-contact-demo@circularisation.fr)
16) template emails pour circularisation en attente
17) notification client only one email per day if auditor issue 10 confirmations (apply basiscally the same scheduler add-ones than banks ultimately)
