# CommentsController
#
# + create
# + update
# + destroy
# - set_comment
# - comment_params
#
class CommentsController < ApplicationController
  before_action :authenticate
  before_action :set_comment, only: [:update, :destroy]
  before_action :comment_params, only: [:create, :destroy]

  # POST /comment(.:format)
  # - Crea un comentario a partir de los parametros que recibe por la HTTP
  # Request. En particular, recibe el parametro "content".
  # - Pre-condiciones: la tabla "comments" no cuenta con este comment.
  # - Post-condiciones: se crea en la tabla "comments" una nueva entrada, con
  # atributos iguales a los parametros entregados por la HTTP Request.
  def create
    @comment = Comment.new comment_params
    @comment.user = current_user

    if @comment.save
      flash[:success] = "El comentario ha sido creado exitosamente."
    else
      flash[:danger] = "Hubo un problema al crear el comentario. " +
                       "Inténtalo nuevamente."
    end

    redirect_to :back
  end

  # PUT /comments/:id(.:format)
  # - Actualiza un comment a partir de los parametros que recibe por la HTTP
  # Request.
  # - Pre-condiciones: la base de datos tiene un comment con el ID indicado.
  # - Post-condiciones: se actualizan las columnas de la tabla "comments" con
  # los parametros entregados por la HTTP Request.
  def update
    @comment.update(content: params[:content])
    render json: { data: 'Comentario Editado' }
  end

  # DELETE /comment/:id(.:format)
  # - Elimina de la base de datos la entrada correspondiente al "Comment" en
  # cuestion. Recibe en la HTTP Request el parametro "id" de este comment.
  # - Pre-condiciones: la tabla "Comment" cuenta con una entrada
  # correspondiente al ID del comment que se recibio como parametro.
  # - Post-condiciones: la tabla "Comment" no cuenta con una entrada
  # correspondiente al ID del comment que se recibio como parametro.
  def destroy
  end

  private

    # - Busca en la tabla "comments" el comment que corresponde al "id" que
    # viene como parametro en la HTTP Request.
    # - Pre-condiciones: la variable de instancia "@comment" no esta definida.
    # - Post-condiciones: la variable de instancia "@comment" tiene el valor del
    # comment con el "id" que viene como parametro en la HTTP Request.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :content, :forum_id)
    end
end
