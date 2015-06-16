module BankaccountsHelper

def show_action_depending_on_bankaccount_status(bankaccount)

#@bankaccountid = bankaccount.id
@id = bankaccount.id
@bankaccount = bankaccount

if current_user.clientcontact?
#l'utilisteur est un contact client
  if bankaccount.signed.nil?
    render '/bankaccounts/action/sign'
  elsif bankaccount.answered.nil?
    render '/bankaccounts/status/nabankclient'
      else
        render '/bankaccounts/status/answered'
  end

    elsif current_user.bankcontact?
#l'utilisateur est un contact banque
      if bankaccount.answered.nil?
        render '/bankaccounts/action/check'
          else
        render '/bankaccounts/status/nafinal'
      end

    else

  if bankaccount.shared.nil? 
  #l'utilisateur est un commissaire aux comptes
         render '/bankaccounts/action/share'
           elsif bankaccount.signed.nil?
             render'/bankaccounts/status/naclient'

          elsif bankaccount.issued.nil?
            render '/bankaccounts/action/issue'
              elsif bankaccount.answered.nil?
                render '/bankaccounts/status/nabank'
                  else
                    render '/bankaccounts/action/report'

  end

  end

end

end
