# app/validators/email_validator.rb

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)

    unless Clientcontact.where(email: :email).exists?
      record.errors[attribute] << (options[:message] || "n'a pas été pré-authentifiée par votre commissaire aux comptes.")
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :clientcontact)
    end


end

