== README

To do:
- enhance testing
- deploy latest version on Heroku
- test live within close circle
- write contact / about & FAQ / legal mention / terms and conditions

- put some new accounts with banque1 & banque2 from scratch
- Creation of bankcontacts is not clear - what should we do when the bankcontact is created what the user should do? Should we ask the bank contact to create its own user like a clientcontact or should the admin setup both a user account and a bank contact
- the bank user should not be able to change his email (actually it does not work) otherwise at one point bank_id is called on a nil class - users should be always created from the template with the correct banks association - same thing for clientcontact - they should be created from the form with the association to the client - when the client logs in it can change some data but not his email address (adjust accordingly)
- the bank account should be created by the bank guy at least so it can choose its password this should be done by sending a link which point to a different create controller than the usual one used within users - should be created with an initial password? other specific view
- no user should be able to change his/her email adresss - this should be given up and a new accounts should be setup
- setup a kind of database to validate the possible email extension for auditors
- dans le formulaire on choisit cac ou non-cac - si non cac il faut pour la validation que l'adresse soit soit dans la base bankcontact ou clientcontact si oui en fonction de la base on créé un profil client ou un profil banque
- missing show/update for clientcontact (maybe others)

Questions:
- discuss the architecture overall
- skinny controller fat models - ie? example of share/sign...
- testing - what is done what to test?
- Framework for testing?
- Framework for login?
- Heroku and other possibility of application
- Management of the database - save? Back-up? Change local vs. remote?
- Change in the database directly with psql? Never?
- Admin view - everything useless access direclty through database access
- which server Puma? What is the difference?
- Best practice in terms of security test is_logged_in and amdin? seems redundant


Done:
- admin views does not access all clients but only those it has created. Admin should not create client but access all other clients
- connection to Heroku database ideally through psql (rails console not enough)
- admin (and probably other view) when I do show on bank resources navbar vanishes
- admin missing links to add a contact bank
- after adding an account should be redirected to the list of account - not the random test page
- When a client logs in but he has already logged in error is email address already taken instead of "you are already registered"
- Welcome screen of client not centered as it should be (go on right)
- Somehow it says that it is not pre-authentified which does not seem to be true
- When you click on account (sign) same for the rest the classification changes and the account go at the bottom some how
- Issue look at Bruno - do not see all bankaccounts he should see especially those that are done - double check the query
- issue if passwords do not match - application says does not in english and not in French
- reinforce authorization especially make sure that some users profile cannot access other resources make sure this is tested
