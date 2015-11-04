class RecursosController < ApplicationController
	before_action :authenticate_user!

	def index
		@recursos = Recurso.all
	end

	def new
		@recurso = Recurso.new
	end

	def show
		@recurso = Recurso.all
 	end
	def edit
 	end


	def create
		@recurso = Recurso.new(recurso_params)

		respond_to do |format|
			if @recurso.save
				format.html { redirect_to posts_path, notice: 'Recurso was successfully created.' }
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
		@recurso = Recurso.find params[:id]
		respond_to do |format|
			if @recurso.update(recurso_params)
				format.html { redirect_to posts_path, notice: 'Recurso was successfully updated.' }
				format.js
			else
				format.html { render :edit }
				format.js
			end
		end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurso
      @recurso = Recurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurso_params
      params.require(:recurso).permit(:name)
    end


end