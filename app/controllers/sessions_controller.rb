class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to posts_path, :notice => 'Logged In'
  	else
  		flash.now.alert = "UserName or Password is incorrect."
  		render "new" 
  	end
   end
   def destroy 
   		session[:user_id] = nil
   		redirect_to posts_path, :notice => 'Logged Out!'
   end
end
