module API
  module V1
    class CategoriesController < ApplicationController
      # GET  /api/v1/contents/category/:id
      # - Se encarga de conseguir todos los "Contents" asociados 
      # a un "Category", indicado por su ID.
      # - Pre-condicion: existe un "Category" que contiene el ID
      # especificado en el HTTP Request.
      def show
      end
    end
  end
end