# API
module Api
  # Version 1
  module V1
    # CategoriesController
    #
    # + index
    # + show
    #
    class CategoriesController < ApplicationController
      # GET /api/v1/categories
      # Muestra todas las categories.
      def index
        categories = Category.all
        render json: { categories: categories }
      end

      # GET /api/v1/contents/category/:id
      # Muestra todos los contents asociados a una category, indicada por su ID.
      def show
        category = Category.find_by(id: params[:id])
        contents = []

        category.contents.each do |content|
          contents << { id: content.id,
                        title: content.title,
                        authorization_status: content.authorization_status }
        end

        category_resp = { name: category.name,
                          contents: contents }

        render json: {category: category_resp}
      end
    end
  end
end
