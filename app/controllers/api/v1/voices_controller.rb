class VoicesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_with_token!

  def create
    @talk_concert = TalkConcert.find(params[:talk_concert_id])
    if @talk_concert.voices.create(user: current_user_with_token)
      render json: { result: "success" }
    else
      render json: { result: "fail" }
    end
  end

  def destroy
    @talk_concert = TalkConcert.find(params[:talk_concert_id])
    
    @voices = @talk_concert.voices.find_by(user: current_user_with_token)

    if @voices.present?
      @voices.destroy
      render json: { result: "success" }
    else
      render json: { result: "fail" }
    end
  end
end
