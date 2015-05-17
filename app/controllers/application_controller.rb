class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # For api authentication
  include Authenticable

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # when authority error happened
  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
  end

  protected

  # for adding user name attribute to Devise gem
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :auth_token) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end

  def enrolled_user?
    param = params[:id] || params[:talk_concert_id]
    @talk_concert = TalkConcert.find(param)

    @enrollment = @talk_concert.enrollments.find_by(user: current_user)

    unless @enrollment.present?
      flash[:danger] = "You didn't enroll in this talk concert"

      redirect_to @talk_concert
    end
  end
end
