# API
module Api
  # Version 1
  module V1
    # ContentsController
    #
    # + index
    # + show
    # + create
    #
    class ContentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      # GET /api/v1/contents
      # - Entregar en formato JSON todos los contents.
      def index
        contents = Content.all
        render json: { contents: contents }
      end

      # GET /api/v1/contents/:id
      # - Entrega en formato JSON el content asociado al ID indicado en la HTTP
      # Request.
      def show
        content = Content.find(params[:id])
        render json: { content: content }
      end

      # POST /api/v1/contents
      # - Crea un content de fuentes externas a traves de un JSON.
      # - Pre-condiciones: la tabla "contents" no cuenta con este content.
      # - Post-condiciones: se crea en la tabla "contents" una nueva entrada a
      # partir del JSON.
      def create
        user_id = User.where(admin: true).first.id
        category_id = Category.find_by(name: "Proceso Constituyente").id
        if category_id.nil?
          category = Category.create({ name: "Proceso Constituyente" })
          category_id = category.id
        end

        contents = JSON.parse(params["contents"])
        # TODO(iaferrer): usar map para hacer mejor el create
        contents.each do |fuente|
          fuente["news-list"].each do |n|

            body_content = ""
            n["body"].each do |body|
              body_content = body_content + body
            end

            # Crea un Content con los parámetros entregados por el scraper.
            Content.create({ title: n["title"], body: body_content,
                             authorization_status: 'pending',
                             category_id: category_id, user_id: user_id })
          end
        end

        render json: { status: 'ok' }
      end
    end
  end
end
