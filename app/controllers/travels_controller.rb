class TravelsController < ApplicationController

def index
  @travels = Travel.all
end

def new
  @travel = Travel.new
end

def edit
  @travel = Travel.find(params[:id])
end

def show
  @travel = Travel.find(params[:id])
end

def update
  @travel = Travel.find(params[:id])
  if @travel.update(travel_params)
    redirect_to travels_path
  else
    render 'edit'
  end
end

def create
  @firstname = current_user.name
  @whatsapp = current_user.whatsapp
  @email = current_user.email
  @travel = Travel.new(travel_params)
    if @travel.save
      flash[:info]="Your travel has been added"
      @travel.update_attribute(:firstname, @firstname)
      @travel.update_attribute(:whatsapp, @whatsapp)
      @travel.update_attribute(:email, @email)
      redirect_to root_url
    else
      render '/travel/new'
    end
end

def destroy
  Travel.find(params[:id]).destroy
  flash[:success]="The travel has been deleted"
  redirect_to request.referrer || root_url
end

private

def travel_params
  params.require(:travel).permit(:from, :to, :pickuptime)
end

end
