class Api::BaseController <  ActionController::Base
  include Swagger::Docs::ImpotentMethods
  before_filter  :authenticate_admin

  private

  def authenticate_admin
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    decoded = JsonWebToken.decode(token)

    @current_admin = Admin.find(decoded[:admin_id].to_i) if decoded
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_admin
  end
end
