class StaticPagesController < ApplicationController
  def home

  end

  def help
  end

  def about
  end

  def contact
  end
  
  def notify
  system "rake notify_banks"
  flash[:info]="Vous venez de notifier les banques"
  end

end
