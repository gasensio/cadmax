class ProyectosController < ApplicationController
	before_action :authenticate_user!

	def index
		@proyectos = Proyecto.all
		@users = User.all
	end

	def new
		@proyecto = Proyecto.new
	end

	def show
		@proyecto = Proyecto.all
 	end
	def edit
 	end


	def create
		@proyecto = Proyecto.new(proyecto_params)

		respond_to do |format|
			if @proyecto.save
				format.html { redirect_to posts_path, notice: 'Proyecto was successfully created.' }
				format.json { render :show, status: :created, location: @post }
				format.js
			else
				format.html { render :new }
				format.json { render json: @post.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	def update
		@proyecto = Proyecto.find params[:id]
		respond_to do |format|
			if @proyecto.update(proyecto_params)
				format.html { redirect_to posts_path, notice: 'Proyecto was successfully updated.' }
				format.js
			else
				format.html { render :edit }
				format.js
			end
		end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:name, :proyecto)
    end


end
