module Api
  module V1
    class ApiController < ApplicationController

      rescue_from ActionController::ParameterMissing do |exception|
        render(json: { message: exception.param }, status: :bad_request)
      end

    end
  end
end
