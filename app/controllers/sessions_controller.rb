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
        message  = "Your account is not activated. "
        message += "Check your email to activate your account."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Your email or password is not correct'
      render 'new'
    end
  end


  def destroy

    log_out if logged_in?
    redirect_to root_url

  end

end
