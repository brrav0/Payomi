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
  @travel = Travel.new(travel_params)
    if @travel.save
      flash[:info]="Your travel has been added"
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
  params.require(:travel).permit(:firstname, :lastname, :whatsapp, :email, :from, :to, :pickuptime)
end

end
