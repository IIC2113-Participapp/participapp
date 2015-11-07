class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]

  # GET /forums(.:format)
  # - Muestra todos los foros de la aplicacion.
  def index
    @forums = Forum.all
  end

  # GET /forums/:id(.:format)
  # - Muestra un foro en particular. Recibe en la HTTP Request el parametro ID
  # correspondiente a dicho foro.
  def show
    @content = Content.find_by(id: @forum.content_id)
  end

  # GET /forums/new(.:format)
  # - Despliega la vista para crear un nuevo foro.
  def new
    @forum = Forum.new
    @contents = Content.where(authorization_status: "true")
  end

  #POST /forum(.:format)
  # - Crea un foro a partir de los parametros que recibe por la HTTP Request.
  # - Pre-condiciones: la tabla "forum" no cuenta con este forum.
  # - Post-condiciones: se crea en la tabla "forums" una nueva entrada, con
  # atributos iguales a los parametros entregados por la HTTP Request, ademas
  # del "user_id" correspondiente al usuario que la creo.
  def create
    @forum = Forum.new forum_params
    @forum.user = current_user

    if @forum.save
      flash[:success] = "Foro creado exitosamente"
      redirect_to @forum
    else
      flash[:danger] = "Hubo un problema al crear el foro. "\
                       "Inténtalo nuevamente."
      render :new
    end
  end

  # GET    /forums/:id/edit(.:format)
  # - Despliega la vista para editar un foro existente. Recibe el parametro
  # ID correspondiente a un foro en la HTTP Request.
  def edit
  end

  # PUT /forum/:id(.:format)
  # - Actualiza un foro a partir de los parametros que recibe por la HTTP
  # Request. Solamente puede cambiar la seccion opinion.
  # - Pre-condiciones: la base de datos cuenta con un forum desactualizado.
  # - Post-condiciones: se actualizan las columnas de la tabla "forums" con
  # los parametros entregados por la HTTP Request.
  def update
  end

  # DELETE /forums/:id(.:format)
  # - Elimina de la base de datos la entrada correspondiente al foro en
  # cuestion. Recibe en la HTTP Request el parametro "id" de este foro.
  # - Pre-condiciones: la tabla "forum" cuenta con una entrada
  # correspondiente al "id" del foro que se recibio como parametro.
  # - Post-condiciones: la tabla "forum" no cuenta con una entrada
  # correspondiente al "id" del foro que se recibio como parametro.
  def destroy
  end

  private

    # - Busca en la base de datos el "forum" que corresponde al "id" que viene
    # como parametro en la HTTP Request.
    # - Pre-condiciones: la variable de instancia "@forum" no esta definida.
    # - Post-condiciones: la variable de instancia "@forum" tiene el valor del
    # "content" con el "id" que viene como parametro en la HTTP Request.
    def set_forum
      @forum = Forum.find_by(id: params[:id])
    end

    def forum_params
      params.require(:forum).permit(:name, :description, :content_id, :user_id)
    end
end
