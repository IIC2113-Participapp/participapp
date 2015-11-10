module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        categories = Category.all
        render json: { categories: categories }
      end

      # GET  /api/v1/contents/category/:id
      # - Se encarga de conseguir todos los "Contents" asociados
      # a un "Category", indicado por su ID.
      # - Pre-condicion: existe un "Category" que contiene el ID
      # especificado en el HTTP Request.
      def show
        category = Category.find(params[:id])
        contents = []
        category.contents.each do |content|
          contents << {id: content.id, title: content.title, authorization_status: content.authorization_status }
        end
        category_resp = {name: category.name, contents: contents}
        render json: {category: category_resp}
      end
    end
  end
end
