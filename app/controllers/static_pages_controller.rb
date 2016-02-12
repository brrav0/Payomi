class StaticPagesController < ApplicationController
  def home
	if logged_in?
		@restaurant = current_user.restaurants.build
		@feed_items = current_user.feed
	end
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def terms_and_conditions
  end
  def notify
  system "rake notify_banks"
  flash[:info]="Vous venez de notifier les banques"
  end

end
