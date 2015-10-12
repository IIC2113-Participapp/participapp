class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET    /category(.:format)
  # - Muestra todas las categories de la aplicacion, paginadas o no paginadas.
  def index
  end

  # GET    /category/:id(.:format)
  # - Muestra una category en particular. Recibe en la HTTP Request el parametro
  # "id" correspondiente a dicha category.
  def show
  end

  # GET    /category/new(.:format)
  # - Despliega la vista para crear una nueva category.
  def new
  end

  # POST   /category(.:format)
  # - Crea una category a partir de los parametros que recibe por la HTTP Request.
  # En particular, recibe el parametro "name".
  # - Pre-condiciones: la tabla "categories" no cuenta con esta category.
  # - Post-condiciones: se crea en la tabla "categories" una nueva entrada, con
  # atributos iguales a los parametros entregados por la HTTP Request.
  def create
  end

  # GET    /category/:id/edit(.:format)
  # - Despliega la vista para editar una category existente. Recibe en la HTTP
  # Request el "id" correspondiente a dicha category.
  def edit
  end

  # PUT    /category/:id(.:format)
  # - Actualiza una category a partir de los parametros que recibe por la HTTP
  # Request. En particular, recibe el parametro "name".
  # - Pre-condiciones: la tabla "categories" cuenta con una category desactualizada.
  # - Post-condiciones: se actualizan las columnas de la tabla "categories" con
  # los parametros entregados por la HTTP Request.
  def update
  end

  # DELETE /categories/:id(.:format)
  # - Elimina de la base de datos la entrada correspondiente a la category en
  # cuestion. Recibe en la HTTP Request el parametro "id" de esta category.
  # - Pre-condiciones: la tabla "categories" cuenta con una entrada
  # correspondiente al "id" de la category que se recibio como parametro.
  # - Post-condiciones: la tabla "categories" no cuenta con una entrada
  # correspondiente al "id" de la category que se recibio como parametro.
  def destroy
  end

  private

    # - Busca en la tabla "categories" la category que corresponde al "id" que
    # viene como parametro en la HTTP Request.
    # - Pre-condiciones: la variable de instancia "@category" no esta definida.
    # - Post-condiciones: la variable de instancia "@category" tiene el valor de
    # la category con el "id" que viene como parametro en la HTTP Request.
    def set_content
      @category = Category.find_by(id: params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
