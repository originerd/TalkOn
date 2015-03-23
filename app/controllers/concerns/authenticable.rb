module Authenticable

  # authentication_with_token and set current_user
  def current_user_with_token
    User.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    unless current_user_with_token.present?
      render json: { result: "fail", errors: ["Not authenticated"] }
    end
  end
end
