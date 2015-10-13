module API
	module V1
		class ContentsController < ApplicationController
			# GET	/api/v1/contents
			# - Es el encargado de buscar y entregar en formato 
			# JSON todos los contents de la aplicación.
			def index
			end

			# GET	/api/v1/contents/:id
			# - Es el encargado de buscar y entregar en formato 
			# JSON el "Content" asociado al parámetro ID indicado
			# en el HTTP Request.
			# Pre-condicion: existe el "Content" asociado al ID 
			# indicado en el HTTP Request. 
			def show
			end
		end
	end
end