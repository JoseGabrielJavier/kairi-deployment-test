class SearchController < ApplicationController
  def index
    @q = Room.where(is_published: true).ransack(params[:q])
    @rooms = @q.result
    @rooms_array = @rooms.to_a
    begin
      @checkin_day = Date.parse(params[:checkin_day])
      @checkout_day = Date.parse(params[:checkout_day])

      @rooms_array.each do |room|
        taken_room = room.reservations.where("(? <= checkin_day AND checkin_day <= ?) OR (? <= checkout_day AND checkout_day <= ?)", @checkin_day, @checkout_day, @checkin_day, @checkout_day)
        if taken_room.any?
          @rooms_array.delete(room)
        end
      end
    rescue
      # flash[:alert] = "Something went wrong"
      # redirect_to root_path
    end
  end
end
