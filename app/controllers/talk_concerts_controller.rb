class TalkConcertsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @talk_concerts = TalkConcert.paginate(page: params[:page])
  end

  def show
    @talk_concert = TalkConcert.find(params[:id])
    @current_user_enrollment = @talk_concert.enrollments.find_by(user: current_user)
    @enrollments = @talk_concert.enrollments
  end

  def new
    @talk_concert = TalkConcert.new
  end

  def create
    @talk_concert = TalkConcert.new(talk_concert_params)
    @talk_concert.user = current_user

    if @talk_concert.save
      flash[:success] = "Talk concert made"
      redirect_to @talk_concert
    else
      render 'new'
    end
  end

  def edit
    @talk_concert = TalkConcert.find(params[:id])

    authorize_action_for @talk_concert
  end

  def update
    @talk_concert = TalkConcert.find(params[:id])

    authorize_action_for @talk_concert

    if @talk_concert.update_attributes(talk_concert_params)
      flash[:success] = "Talk concert updated"
      redirect_to @talk_concert
    else
      render 'edit'
    end
  end

  def destroy
    @talk_concert = TalkConcert.find(params[:id])

    authorize_action_for @talk_concert

    @talk_concert.destroy

    flash[:success] = "Talk concert deleted"
    redirect_to talk_concerts_url
  end

  private

  def talk_concert_params
    params.require(:talk_concert).permit(:title, :start_time, :end_time, :location, :people_limit, :content, :enroll_start_time, :enroll_end_time)
  end
end
