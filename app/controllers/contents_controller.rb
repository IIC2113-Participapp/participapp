# ContentsController
#
# + index
# + pending_authorization
# + show
# + new
# + create
# + edit
# + update
# + change_auth_status
# + destroy
# - set_content
# - content_params
#
class ContentsController < ApplicationController
  before_action :authenticate
  before_action :authorize_editor, only: [:pending_authorization, :reject,
                                          :authorize]
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /content(.:format)
  # - Muestra todos los contents de la aplicacion, paginados o no paginados.
  def index
    @categories = Category.all
  end

  # GET /pending_authorization(.:format)
  # - Muestra todos los contents de la aplicacion que no han sido aprobados.
  def pending_authorization
    @contents = Content.pending
  end

  # GET /content/:id(.:format)
  # - Muestra un content en particular. Recibe en la HTTP Request el parametro
  # "id" correspondiente a dicho content.
  def show
  end

  # GET /content/new(.:format)
  # - Despliega la vista para crear un nuevo content.
  def new
    @content = Content.new
  end

  # POST /content(.:format)
  # - Crea un content a partir de los parametros que recibe por la HTTP Request.
  # En particular, recibe los parametros "title", "body" y "category_id".
  # - Pre-condiciones: la tabla "contents" no cuenta con este content.
  # - Post-condiciones: se crea en la tabla "contents" una nueva entrada, con
  # atributos iguales a los parametros entregados por la HTTP Request, ademas
  # del "user_id" correspondiente al usuario que la creo.
  def create
    @content = Content.new content_params
    @content.author = current_user

    if @content.save
      if current_user.admin? || current_user.editor?
        flash[:success] = "La noticia ha sido creada exitosamente."
        @content.change_auth_status 'authorized'
      else
        flash[:success] = "La noticia ha sido creada exitosamente. "\
                          "Los editores deberán aprobarla ahora."
      end

      redirect_to content_path @content
    else
      flash.now[:danger] = "Hubo un problema al crear la noticia. "\
                           "Inténtalo nuevamente."

      render 'new'
    end
  end

  # GET /content/:id/edit(.:format)
  # - Despliega la vista para editar un content existente. Recibe el parametro
  # "id" correspondiente a un content en la HTTP Request.
  def edit
  end

  # PUT /content/:id(.:format)
  # - Actualiza un content a partir de los parametros que recibe por la HTTP
  # Request. En particular, recibe los parametros "title" y "body".
  # - Pre-condiciones: la base de datos cuenta con un content desactualizado.
  # - Post-condiciones: se actualizan las columnas de la tabla "contents" con
  # los parametros entregados por la HTTP Request.
  def update
    if @content.update_attributes(content_params)
      flash[:success] = "La noticia ha sido actualizada exitosamente."
    else
      flash[:danger] = "La noticia no pudo ser actualizada. "\
                       "Inténtalo nuevamente."
    end

    redirect_to :back
  end

  # PUT /contents/:content_id/change_auth_status(.:format)
  # Cambia el authorization_status del content en cuestion.
  # - Pre-condiciones: el campo authorization_status del content en cuestion
  # tiene un valor de "pending", "rejected" o "authorized".
  # - Post-condiciones: el campo authorization_status del content en cuestion
  # tiene un valor de "rejected" o "authorized".
  def change_auth_status
    content = Content.find_by(id: params[:content_id])
    new_status = params[:status]

    if content && (new_status == 'authorized' || new_status == 'rejected')
      flash[:success] = "El estado de la noticia ha cambiado a #{new_status}"
      content.change_auth_status new_status
    else
      flash[:danger] = "La noticia no fue encontrada. Inténtalo nuevamente."
    end

    redirect_to pending_authorization_path
  end

  # DELETE /content/:id(.:format)
  # - Elimina de la base de datos la entrada correspondiente al content en
  # cuestion. Recibe en la HTTP Request el parametro "id" de este content.
  # - Pre-condiciones: la tabla "contents" cuenta con una entrada
  # correspondiente al "id" del content que se recibio como parametro.
  # - Post-condiciones: la tabla "contents" no cuenta con una entrada
  # correspondiente al "id" del content que se recibio como parametro.
  def destroy
    if @content
      flash[:success] = "La noticia ha sido eliminada exitosamente."
      @content.destroy
    else
      flash[:danger] = "La noticia que deseas eliminar no fue encontrada. "\
                       "Inténtalo nuevamente."
    end

    redirect_to :back
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
      params.require(:content)
            .permit(:title, :body, :category_id, :authorization_status)
    end
end
