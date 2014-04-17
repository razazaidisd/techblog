class CommentsController < ApplicationController
	before_filter :authorize, only: [:create]
	#before_filter :authorize_comment, only: [:edit, :delete]
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment])
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to post_path(@post), :notice => 'Comment Created'
		else
			redirect_to post_path(@post), :error => 'Something went wrong'
		end
	end
	def show
		#@view = Comment.find(params[:post_id])
	end
	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		@comment = @comment.update_attributes(params[:comment])
		@com = Comment.find(params[:id])
		redirect_to post_path(@com.post_id)
	end
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(@comment.post_id)
	end
end
