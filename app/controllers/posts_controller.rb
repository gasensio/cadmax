class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]



  # GET /posts
  # GET /posts.json
  def index
    if current_user.admin?
      @posts = Post.all.search(params[:search])
      @posts_by_date = Post.search(params[:search])
    else
      @posts = Post.all.where(:user_id => current_user)
    end
    @post = Post.new
    @posts_by_date = @posts.group_by(&:alta)
    @posts_by_user = @posts.group_by(&:user_id)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @users = User.all
    respond_to do |format|
        format.html
        format.csv { send_data @posts.to_csv }
        format.xls # { send_data @posts.to_csv(col_sep: "\t") }
      end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
     @post = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :pedido, :horasof, :horasnf, :extra, :extraf, :nocturnas, :vacaciones, :bolsahg, :bolsahu, :alta, :search, :status )
    end
end
