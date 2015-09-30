class ForosController < ApplicationController
	before_action :authenticate_user!
  	before_action :set_foro, only: [:show, :edit, :update, :destroy]


	def index
		@foros = Foro.all.search(params[:search]).order('created_at DESC')


    @foro = Foro.new
    @proyectos = Proyecto.all
    @proyecto = Proyecto.new
    @posts = Post.all.search(params[:search])
    @posts_by_date = Post.search(params[:search])
    @users = User.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
	end
	def show


	end



	def create

		@foro = current_user.foros.new(foro_params)

		respond_to do |format|
			if @foro.save
				format.html { redirect_to foros_index_path, notice: 'Entrada was successfully created.' }
				format.json { render :show, status: :created, location: @foro }
				format.js
			else
				format.html { render :new }
				format.json { render json: @post.errors, notice: :unprocessable_entity }
				format.js
			end
		end
	end

	def destroy
    @foro.destroy
    respond_to do |format|
      format.html { redirect_to foro_index_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_foro
      @foro = Foro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foro_params
      params.require(:foro).permit(:titulo, :contenido, :user_id, :proyecto_id, :search)
    end


end