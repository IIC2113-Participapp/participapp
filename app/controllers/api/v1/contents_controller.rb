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
      # - Entrega en formato JSON todos los contents.
      def index
        contents = Content.all
        render json: { contents: contents }
      end

      # GET /api/v1/contents/:id
      # - Entrega en formato JSON el content asociado al ID indicado en la HTTP
      # Request.
      def show
        content = Content.find_by(id: params[:id])
        render json: { content: content }
      end

      # POST /api/v1/contents
      # - Crea un content de fuentes externas a traves de un JSON.
      # - Pre-condiciones: la tabla "contents" no cuenta con este content.
      # - Post-condiciones: se crea en la tabla "contents" una nueva entrada a
      # partir del JSON.
      def create
        usr_id = User.where(admin: true).first.id

        cat = Category.find_by(name: "Prensa")
        cat = Category.create({ name: "Prensa" }) unless cat
        cat_id = cat.id

        contents = JSON.parse(params["contents"])
        contents.each do |source|
          source["news-list"].each do |n|
            body = n["body"].join()
            Content.create({ title: n["title"], body: body, category_id: cat_id,
                             user_id: usr_id, authorization_status: 'pending' })
          end
        end

        render json: { status: 'ok' }
      end
    end
  end
end
