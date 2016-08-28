class DateplanController < ApplicationController
  def show
  end

  def create
    places = JSON.parse(params[:places])
    if Dateplan.create(user_id: current_user.id, places: places, title: "plan")
      render json: {}, status: 200
    end
  end
end