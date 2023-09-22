class PostsController < ApplicationController
	before_action :comment, only: [:show,
	 :new_sub_demo, :create_sub_demo]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end
	
	def new_comment
    @comment = @post.comment
  end

  def create_sub_demo
    @comment = @post.build_comment(comment_params)
    if @comment.save
      redirect_to @post
    else
      render new_comment, status: :unprocessable_entity
    end
  end

	private
	def post_params
    params.require(:post).permit(:name, :number)
  end

  def comment
    @post = Post.find_by(id: params[:id])
  end

  def comment_params
    params.permit(:name)
  end

end




