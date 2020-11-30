module Api
  module V1
    class ApiController < ApplicationController
      rescue_from Exception do |exception|
        render(json: { message: "Error server error" }, :status => 500)
      end

      rescue_from Exception do |exception|
        render(json: { message: "Error problem in request" }, :status => 400)
      end

      rescue_from Exception do |exception|
        render(json: { message: "Error not found" }, :status => 404)
      end

      rescue_from ActionController::RoutingError do |exception|
        render(json: { message: "Error not found"}, status: :not_found)
      end
    end
  end
end
