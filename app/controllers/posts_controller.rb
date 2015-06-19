class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

        @post.save

        #↓あとでやる
        redirect_to "/posts/#{@post.id}"
  end

  def show
  end

  def index
   @posts = Post.all
  end

  def edit
  end

  def update

    @post.update_attributes(post_params)

    redirect_to"/posts/#{@post.id}"
  end

  def destroy

    @post.destroy
    redirect_to "/"
  end


  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :title,
        :body,
        :category
        )

    end


end
