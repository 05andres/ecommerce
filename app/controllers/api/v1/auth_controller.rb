# frozen_string_literal: true

class Api::V1::AuthController < Api::BaseController
  skip_before_filter :authenticate_admin, only: [:login]

  def login
    admin = Admin.where(email: params[:email]).first
    if admin && admin.authenticate(params[:password])
      token = JsonWebToken.encode({ admin_id: admin.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

end
