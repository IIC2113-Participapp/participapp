module Api
  module V1
    class ContentsController < ApplicationController
      skip_before_action :verify_authenticity_token

      # GET  /api/v1/contents
      # - Es el encargado de buscar y entregar en formato JSON todos los
      # contents de la aplicación.
      def index
        contents = Content.all
        render json: { contents: contents }
      end

      # GET  /api/v1/contents/:id
      # - Es el encargado de buscar y entregar en formato JSON el "Content"
      # asociado al parámetro ID indicado en el HTTP Request.
      # - Pre-condicion: existe el "Content" asociado al ID indicado en el HTTP
      # Request.
      def show
        content = Content.find(params[:id])
        render json: { content: content }
      end

      # POST /api/v1/contents
      # - Se encarga de crear un contenido a través de la API de la aplicación, recibiendo
      # un JSON con todas las noticias obtenidas de las fuentes externas.
      # - Pre-condición: El componente Scraper obtiene noticias de distintas fuentes y la
      # envía en el formato descrito más abajo para crear un Content.
      # - Post-condición: Se crean los "Contents" que contienen la información entregada
      # por el scraper.
      def create
        # Buscamos el id de un Administrador y Category para asignarselo a todas las noticias
        # obtenidas de fuentes externas.
        user_id = User.where(admin: true).first.id
        # TODO: crear category si no existe        
        category_id = Category.find_by(name: "Proceso Constituyente").id
        if category_id.nil? 
          category = Category.create({
            name: "Proceso Constituyente"
            })
          category_id = category.id
        end
        contents = JSON.parse(params["contents"])
        #TODO(iaferrer): usar map para hacer mejor el create
        contents.each do |fuente|
          fuente["news-list"].each do |n|

            # Crea un String con todos los campos del arreglo entregado por el scraper.
            body_content = ""
            n["body"].each do |body|
              body_content = body_content + body
            end

            # Crea un Content con los parámetros entregados por el scraper.
            Content.create({
              title: n["title"],
              body: body_content,
              authorization_status: 'pending',
              category_id: category_id,
              user_id: user_id
              })
          end
        end
        render json: { status: 'ok' }
      end
    end
  end
end
