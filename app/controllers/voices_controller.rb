class VoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :enrolled_user?, only: [:create]

  def create
    @talk_concert = TalkConcert.find(params[:talk_concert_id])
    if @talk_concert.voices.create(user: current_user)
      flash[:success] = "You have required voice"
    else
      flash[:danger] = "You are failed to require voice"
    end
      redirect_to room_talk_concert_path(@talk_concert)
  end

  def destroy
    @talk_concert = TalkConcert.find(params[:talk_concert_id])
    
    @voices = @talk_concert.voices.find_by(user: current_user)

    if @voices.present?
      @voices.destroy
      flash[:success] = "You have withdrawn"
    else
      flash[:danger] = "You aren't in voice-list"
    end
    redirect_to room_talk_concert_path(@talk_concert)
  end
end
