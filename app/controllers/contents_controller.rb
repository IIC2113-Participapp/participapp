class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET    /content(.:format)
  # - Muestra todos los contents de la aplicación, paginados o no paginados.
  def index
  end

  # GET    /content/:id(.:format)
  # - Muestra un content en particular. Recibe el parámetro "id" correspondiente
  # a un content en la HTTP Request.
  def show
  end

  # GET    /content/new(.:format)
  # - Despliega la vista para crear un nuevo "content".
  def new
  end

  # POST   /content(.:format)
  # - Crea un content a partir de los parámetros que recibe por la HTTP Request.
  # En particular, recibe los parámetros "title", "body" y "user_id".
  # - Pre-condiciones: la base de datos no cuenta con este "content".
  # - Post-condiciones: se crea en la base de datos una nueva entrada en la
  # tabla "contents", con atributos iguales a los parámetros entregados por la
  # HTTP Request.
  def create
  end

  # GET    /content/:id/edit(.:format)
  # - Despliega la vista para editar un "content" existente. Recibe el parámetro
  # "id" correspondiente a un content en la HTTP Request.
  def edit
  end

  # PUT    /content/:id(.:format)
  # - Actualiza un content a partir de los parámetros que recibe por la HTTP
  # Request. En particular, recibe los parámetros "title", "body" y "user_id".
  # - Pre-condiciones: la base de datos cuenta con un content desactualizado.
  # - Post-condiciones: se actualizan las columnas de la tabla "contents" con
  # los parámetros entregados por la HTTP Request (POST)
  def update
  end

  # DELETE /content/:id(.:format)
  # - Elimina de la base de datos la entrada correspondiente al "content" en
  # cuestión. Recibe el parámetro "id" correspondiente a un content en la HTTP
  # Request.
  # - Pre-condiciones: la base de datos cuenta con una entrada correspondiente
  # al "id" del content que se recibió como parámetro.
  # - Post-condiciones: la base de datos no cuenta con una entrada
  # correspondiente al "id" del content que se recibió como parámetro.
  def destroy
  end

  private

    # - Busca en la base de datos el "content" que corresponde al "id" que viene
    # como parámetro en la HTTP Request.
    # - Pre-condiciones: la variable de instancia "@content" no está definida.
    # - Post-condiciones: la variable de instancia "@content" tiene el valor del
    # "content" con el "id" que viene como parámetro en la HTTP Request.
    def set_content
      @content = Content.find_by(id: params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :body, :authorization_status)
    end
end
