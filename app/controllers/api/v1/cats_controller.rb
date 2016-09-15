module Api
  module V1
    class CatsController < ApplicationController

      def index
        render json: Cat.all
      end

    end
  end
end
