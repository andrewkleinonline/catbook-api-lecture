module Api
  module V1
    class CatsController < ApplicationController

      def index
        render json: Cat.all
      end

      def show
        render json: Cat.find(params[:id])
      end

      def create
        cat = Cat.create(cat_params)
        if cat.save
          render json: cat
        else
          render json: cat.errors, status: 500
        end
      end

      def update
        cat = Cat.find(params[:id])
        if cat.update(cat_params)
          render json: cat
        else
          render json: cat.errors, status: 500
        end

      end

      private

      def cat_params
        params.require(:cat).permit(:name, :breed, :temperament, :weight)
      end

    end
  end
end
