class CommentsController < ApplicationController
  before_action :comment_params, only: [:update, :destroy]

  #POST   /comment(.:format)
  # - Es el método encargado de crear una nueva entrada a
  # la tabla "Comment" con los parámetros especificados en
  # el formulario.
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      forum = Forum.find(@comment.forum_id)
      redirect_to forum_path(forum)
    else

    end
  end

  # PUT    /comments/:id(.:format)
  # - Actualiza un comment a partir de los parametros que recibe por la HTTP
  # Request. Solamente puede cambiar el .
  # - Pre-condiciones: la base de datos cuenta con un comment con el ID indicado.
  # - Post-condiciones: se actualizan las columnas de la tabla "Comment" con
  # los parametros entregados por la HTTP Request.
  def update
  end

  # DELETE/comment/:id(.:format)
  # - Elimina de la base de datos la entrada correspondiente al "Comment" en
  # cuestion. Recibe en la HTTP Request el parametro "id" de este comment.
  # - Pre-condiciones: la tabla "Comment" cuenta con una entrada
  # correspondiente al ID del comment que se recibio como parametro.
  # - Post-condiciones: la tabla "Comment" no cuenta con una entrada
  # correspondiente al ID del comment que se recibio como parametro.
  def destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:user_id, :content, :forum_id)
  end

end
