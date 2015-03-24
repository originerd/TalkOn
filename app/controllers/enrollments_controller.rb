class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @talk_concert = TalkConcert.find(params[:talk_concert_id])
    if @talk_concert.enrollments.create(user: current_user)
      flash[:success] = "You have enrolled"
      redirect_to talk_concert_path(@talk_concert)
    else
      flash[:danger] = "You are failed to enroll"
      render @talk_concert
    end
  end

  def destroy
    @talk_concert = TalkConcert.find(params[:talk_concert_id])
    
    @enrollments = @talk_concert.enrollments.find_by(user: current_user)

    if @enrollments.present?
      @enrollments.destroy
      flash[:success] = "You have withdrawn"
    else
      flash[:danger] = "You aren't in enroll-list"
    end
    redirect_to talk_concert_path(@talk_concert)
  end
end
