module Api
  module V1
    class DocsController < Api::BaseController
      skip_before_filter :authenticate_admin, only: [:index]

      def index
        render json: File.read(Rails.root.join('public', 'api', 'v1', 'swagger.json'))
      end
    end
  end
end
