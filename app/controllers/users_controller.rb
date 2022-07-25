class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @published_rooms = @user.rooms.where(is_published: true)
    @rooms = @user.rooms.where(is_published: true).limit(6).order(created_at: :desc)
    @review_from_hosts = @user.reviews_from_host.where(review_type: "host_to_guest")
    @review_from_guests = @user.reviews_from_guest.where(review_type: "guest_to_host")
  end
end
