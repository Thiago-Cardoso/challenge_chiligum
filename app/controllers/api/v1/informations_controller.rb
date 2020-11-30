module Api
  module V1
    class InformationsController < Api::V1::ApiController
      def index
        not_found
      end
      def show
        if params[:id]
          result = InformationService.new(params[:id]).call
          render json: result
        else
          not_found
        end
          rescue => error
            render json: { errors: "Error not was informed id character"}, status: :unprocessable_entity
        end
      end
  end
end
