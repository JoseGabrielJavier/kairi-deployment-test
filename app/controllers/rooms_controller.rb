class RoomsController < ApplicationController
  before_action :logged_in_user

  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.new(room_params)

    if @room.save
      flash[:success] = "You successfully created a room."
      redirect_to listing_room_path(@room.id)
    else
      render "new"
    end
  end

  def listing
    @room = Room.find(params[:id])
  end

  def price
    @room = Room.find(params[:id])
  end

  def description
    @room = Room.find(params[:id])
  end

  def amenities
    @room = Room.find(params[:id])
  end

  def photoes
    @room = Room.find(params[:id])
    @photos = @room.photos
  end

  def location
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:success] = "Saved."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Something went wrong"
      redirect_back(fallback_location: root_path)
    end
  end

  def delete_photo
    @room = Room.find(params[:room])
    @photo = @room.photos.find(params[:photo])
    @photo.purge
    flash[:success] = "Successfully delete the photo."
    redirect_back(fallback_location: root_path)
  end

  def update_is_published 
    @room = Room.find(params[:id])
    @room.update_attributes(is_published: true)
    flash[:success] = "You can publish the room"
    redirect_to root_path
  end

  def show
    @room = Room.find(params[:id])
    if @room.is_published?
      @photo = @room.photos.first
      @publisher = User.find(@room.user_id)
      @reservation = current_user.reservations.new
    else
      flash[:alert] = "You haven't published the room."
      redirect_to root_path
    end
  end

  def index
    @rooms = current_user.rooms
  end

  private
    def room_params
      params.require(:room).permit(:home_type, :bedroom, :room_type, :bathroom, :accommodate, :price, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_internet, :is_heating, :is_ac, :longitude, :latitude, photos: [])
    end
end
