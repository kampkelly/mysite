class PostsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
  	@posts = Post.all
  end

  def new
    @categories = Category.all
  	@post = Post.new
  end

  def create
  	 	@posts = Post.new(posts_params)
        if @posts.save
          flash[:notice] = 'Post has been created'
            redirect_to posts_path
        else
            render new
        end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	 if @post.update_attributes(posts_params)
      flash[:notice] = 'Post successfully updated'
        redirect_to post_path
    else
        render new
    end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
    flash[:delete] = 'Post deleted'
  	redirect_to posts_path
  end

    private
  		def posts_params
            params.require(:post).permit(:title, :body, :user_id, :category_id)
        end
end
