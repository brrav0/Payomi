class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @spot = Spot.new
      @micropost = @spot.microposts.build
      @feed_items = current_user.feed      
      @recommendation = Recommendation.new
      @save = Save.new

      #build an array of the current_user saved spots
      @saved = Save.where("user_id =?", current_user.id)
        @array_of_spot_id = []
	  @saved.each do |p|
	    @array_of_spot_id.push(p.spot_id)
	  end
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
