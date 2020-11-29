module Api
  module V1
    class InformationsController < Api::V1::ApiController
      def show
        result = InformationService.new(params[:id]).call
          render json: result
          rescue => error
            render json: { errors: "Error was not informed the character id"}, status: :unprocessable_entity
          end
      end
  end
end
