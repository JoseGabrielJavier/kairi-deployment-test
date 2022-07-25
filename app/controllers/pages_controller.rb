class PagesController < ApplicationController
  def home
    @rooms = Room.all.where(is_published: true).limit(3).order(created_at: :desc)
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
end
