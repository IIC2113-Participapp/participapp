class ForumsController < ApplicationController

	# GET    /forums(.:format)
	# - Muestra todos los foros de la aplicacion.
	def index
	end

	# GET    /forums/new(.:format)
  	# - Despliega la vista para crear un nuevo foro.
	def new
	end

	#POST 	/forum(.:format)
	# - Crea un foro con los parámetros enviados a través del formulario adjunto
	# con el HTTP Request.
	# Pre-condiciones: los parámetros del forumlario son validados por el modelo,
	# agregando toda la información necesaria y datos relevantes.
	# Post-condiciones: la tabla "Forum" contiene una entrada con los parámetros
	# indicados en el formulario.
	def create
	end

	# GET    /forums/:id(.:format)
	# - Muestra un foro en particular. Recibe en la HTTP Request el parametro
	# ID correspondiente a dicho foro.
	# Pre-condiciones: la tabla "Forums" cuenta con una entrada que tiene como
	# ID el entregado por el HTTP Request.
	def show
	end

	# GET    /forums/:id/edit(.:format)
	# - Despliega la vista para editar un foro existente. Recibe el parametro
	# ID correspondiente a un foro en la HTTP Request.
	# Pre-condiciones: la tabla "Forums" cuenta con una entrada que tiene como
	# ID el entregado por el HTTP Request.
	def edit
	end

	# PUT    /forum/:id(.:format)
	# - Actualiza un foro a partir de los parametros que recibe por la HTTP
	# Request. Solamente puede cambiar la sección Opinion.
	# Pre-condiciones: la tabla "Forums" cuenta con una entrada que tiene como
	# ID el entregado por el HTTP Request.
	# Post-condiciones: se actualizan las columnas de la tabla "forum" con
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

	# POST 	/forums/:id/comment(.:format)
	# - Crea un nuevo comentario para el foro correspondiente al "id" del HTTP
	# Request.
	# - Pre-condiciones: la tabla "forum" cuenta con una entrada correspondiente
	# al "id" del foro que se recibio como parámetro.
	# - Post-condiciones: el objeto "forum" correspondiente al id del HTTP Request
	# contiene una instancia del objeto "Comment" que contiene lo indicado en el
	# formulario enviado por HTTP.
	def new_comment
	end

	private

	# - Busca en la base de datos el "forum" que corresponde al "id" que viene
    # como parametro en la HTTP Request.
    # - Pre-condiciones: la variable de instancia "@forum" no esta definida.
    # - Post-condiciones: la variable de instancia "@forum" tiene el valor del
    # "content" con el "id" que viene como parametro en la HTTP Request.
    def set_content
		@forum = Forum.find_by(id: params[:id])
    end

    def forum_params
		params.require(:forum).permit(:topic, :description, :opinion, :content_id, :user_id)
    end
end
