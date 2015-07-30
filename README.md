== README

To do:
1) deploy latest version on Heroku
2) test live within close circles
3) enhance testing
4) write contact / about & FAQ / legal mention / terms and conditions
5) work on editing client & bankaccounts when correction are necessary - we need to think of what can be changed and what should not (bankaccounts number for instance and/or address email for cliencontact)
- test the scheduler
- email sent formatting and wording
- test live of the daily notification
- contact client/client should be merged in one single table with possibilty of changing them together if necessary two different view is not the best
6) email sending function is not developped (not necessary)

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
- How do you usually manage deletion with dependent items / belongs to - prevent from deletion - error messages stating that there is dependent items? Check if presence before deleting


Done:
- missing show/update for clientcontact (maybe others)
- dans le formulaire on choisit cac ou non-cac - si non cac il faut pour la validation que l'adresse soit soit dans la base bankcontact ou clientcontact si oui en fonction de la base on créé un profil client ou un profil banque
- the bank account should be created by the bank guy at least so it can choose its password this should be done by sending a link which point to a different create controller than the usual one used within users - should be created with an initial password? other specific view
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
- show client show the navbaradmin instead of navbar users
