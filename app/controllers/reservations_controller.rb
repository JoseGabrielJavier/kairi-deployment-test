class ReservationsController < ApplicationController


  def create
    @reservation = current_user.reservations.new(reservation_params) 

    if @reservation.save
      redirect_to root_path
      flash[:notice] = "You successfully reserve a room."
    else
      redirect_to room_path(params[:reservation][:room_id])
      flash[:alert] = "You can't reserve a room."
    end
  end

  def your_reservations
    @user = current_user
  end

  def your_trips
    @user = current_user
  end

  private
    def reservation_params
      params.require(:reservation).permit(:checkin_day, :checkout_day, :total_price, :room_id)
    end
end