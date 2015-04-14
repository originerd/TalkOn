class TalkConcertsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_with_token!, except: [ :index, :show ]

  def index
    @talk_concerts = TalkConcert.paginate(page: params[:page])
    render json: { result: "success", talk_concerts: @talk_concerts }
  end

  def show
    @talk_concert = TalkConcert.find(params[:id])
    
    if @talk_concert
      render json: { result: "success", talk_concert: @talk_concert }
    else
      render json: { result: "fail" }
    end
  end

  def create
    @talk_concert = TalkConcert.new(talk_concert_params)
    @talk_concert.user = current_user_with_token

    if @talk_concert.save
      render json: { result: "success", talk_concert: @talk_concert }
    else
      render json: { result: "fail", errors: @talk_concert.errors }
    end
  end

  def update
    @talk_concert = TalkConcert.find(params[:id])

    if current_user_with_token == @talk_concert.user
      if @talk_concert.update_attributes(talk_concert_params)
        render json: { result: "success", talk_concert: @talk_concert }
      else
        render json: { result: "fail", errors: @talk_concert.errors }
      end
    else
      render json: { result: "fail" }
    end
  end

  def destroy
    @talk_concert = TalkConcert.find(params[:id])

    if current_user_with_token == @talk_concert.user
      @talk_concert.destroy
      render json: { result: "success" }
    else
      render json: { result: "fail" }
    end
  end

  private

  def talk_concert_params
    params.require(:talk_concert).permit(:title, :start_time, :end_time, :location, :people_limit, :content, :enroll_start_time, :enroll_end_time)
  end
end
