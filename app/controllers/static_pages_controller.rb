class StaticPagesController < ApplicationController
  def home
    if logged_in?
      #@micropost = current_user.microposts.build
      @spot = Spot.new
      @micropost = @spot.microposts.build
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
