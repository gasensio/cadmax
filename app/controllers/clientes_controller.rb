class ClientesController < ApplicationController
	before_action :authenticate_user!

	def index
		@clientes = Cliente.all
	end

	def new
		@cliente = Cliente.new
	end

	def show
		@cliente = Cliente.all
 	end
	def edit
 	end


	def create
		@cliente = Cliente.new(cliente_params)

		respond_to do |format|
			if @cliente.save
				format.html { redirect_to posts_path, notice: 'Cliente was successfully created.' }
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
		@cliente = Cliente.find params[:id]
		respond_to do |format|
			if @cliente.update(cliente_params)
				format.html { redirect_to posts_path, notice: 'Cliente was successfully updated.' }
				format.js
			else
				format.html { render :edit }
				format.js
			end
		end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:name)
    end


end
