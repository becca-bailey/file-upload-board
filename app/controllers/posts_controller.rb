class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  # GET /posts
  # GET /posts.json
  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  # def show
  # end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  # POST /posts
  # POST /posts.json
  def create
    p params
    @post = current_user.posts.new(post_params)
    @category = Category.find(params[:category_id])
    @post.category_id = @category.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to category_posts_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to category_posts_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to category_posts_path, notice: 'Post was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :link_url, :body, :image)
    end
end
