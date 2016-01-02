class SessionsController < ApplicationController
  def new
  end

    def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or root_url
      else
        message  = "Votre compte n'est pas activé. "
        message += "Consultez vos emails pour activer votre compte."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Votre email/mot de passe est incorrect'
      render 'new'
    end
  end


  def destroy

    log_out if logged_in?
    redirect_to root_url

  end

end
