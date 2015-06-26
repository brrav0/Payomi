# app/validators/email_validator.rb

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, email)
     
    unless Clientcontact.where(email: email).exists?
       
       #record.errors[:email] << "On a besoin d'une addresse pré-authentifiée"
       record.errors[attribute] << (options[:message] || "doit être pré-authentifiée par votre commissaire aux comptes")
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :clientcontact)
    end


end

