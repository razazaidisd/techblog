class ApplicationController < ActionController::Base
  protect_from_forgery
  private	
  def current_user
  	@current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  def authorize
  	redirect_to login_url, notice: "To perform this action. Please Login to our Application" if current_user.nil?
  end
  def authorize_comment
  	if Comment.user_id != current_user.id
  	redirect_to post_url, notice: "Sorry, you can't edit/destroy this comment."
 	end
	
	#@authorize_comment = Comment.where(:user_id => current_user.id)
  	#if @authorize_comment
  	#redirect_to post_url, notice: "Sorry, you can't edit/destroy this comment."
 	#end

  end
end
