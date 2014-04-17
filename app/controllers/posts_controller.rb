class PostsController < ApplicationController
	before_filter :authorize, only: [:new, :edit, :update, :destroy]
	def index
		@post = Post.all
	end
	def show
		@post = Post.find(params[:id])
		posted_id = Post.find(params[:id])
		@view = Comment.where(:post_id => posted_id )
		@comment = Comment.new

		
	end
	def new
		@post = Post.new
	end
	def create
		@userid = User.find(params[:user_id])
		@post = @userid.posts.build(params[:post])


		#@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path, :notice => 'Successfully Created'
		else
			redirect_to posts_path, :error => 'Something went wrong'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post = @post.update_attributes(params[:post])
		redirect_to posts_path
	end
	

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

end
