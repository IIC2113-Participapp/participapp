class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET    /content(.:format)
  # - Muestra todos los contents de la aplicacion, paginados o no paginados.
  def index
  end

  # GET    /content/:id(.:format)
  # - Muestra un content en particular. Recibe en la HTTP Request el parametro
  # "id" correspondiente a dicho content.
  def show
  end

  # GET    /content/new(.:format)
  # - Despliega la vista para crear un nuevo content.
  def new
    @content = Content.new
  end

  # POST   /content(.:format)
  # - Crea un content a partir de los parametros que recibe por la HTTP Request.
  # En particular, recibe los parametros "title" y "body".
  # - Pre-condiciones: la tabla "contents" no cuenta con este content.
  # - Post-condiciones: se crea en la tabla "contents" una nueva entrada, con
  # atributos iguales a los parametros entregados por la HTTP Request, ademas
  # del "user_id" correspondiente al usuario que la creo.
  def create
  end

  # GET    /content/:id/edit(.:format)
  # - Despliega la vista para editar un content existente. Recibe el parametro
  # "id" correspondiente a un content en la HTTP Request.
  def edit
  end

  # PUT    /content/:id(.:format)
  # - Actualiza un content a partir de los parametros que recibe por la HTTP
  # Request. En particular, recibe los parametros "title" y "body".
  # - Pre-condiciones: la base de datos cuenta con un content desactualizado.
  # - Post-condiciones: se actualizan las columnas de la tabla "contents" con
  # los parametros entregados por la HTTP Request.
  def update
  end

  # DELETE /content/:id(.:format)
  # - Elimina de la base de datos la entrada correspondiente al content en
  # cuestion. Recibe en la HTTP Request el parametro "id" de este content.
  # - Pre-condiciones: la tabla "contents" cuenta con una entrada
  # correspondiente al "id" del content que se recibio como parametro.
  # - Post-condiciones: la tabla "contents" no cuenta con una entrada
  # correspondiente al "id" del content que se recibio como parametro.
  def destroy
  end

  private

    # - Busca en la base de datos el "content" que corresponde al "id" que viene
    # como parametro en la HTTP Request.
    # - Pre-condiciones: la variable de instancia "@content" no esta definida.
    # - Post-condiciones: la variable de instancia "@content" tiene el valor del
    # "content" con el "id" que viene como parametro en la HTTP Request.
    def set_content
      @content = Content.find_by(id: params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :body, :authorization_status)
    end
end
