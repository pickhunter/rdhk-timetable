class SessionsController < ApplicationController
	def new
    end

	def create
	  @user = User.find_by(username: params[:session][:username])
	  if @user && @user.authenticate(params[:session][:password])
	    session[:user_id] = @user.id
	    session[:username] = @user.username
	    redirect_to '/home/index'
	  else
	  	flash[:danger] = 'Invalid email/password combination'
	    # redirect_to(action: 'new')
	    redirect_to('/login')
	  end 
	end

	def destroy 
	  session[:user_id] = nil 
	  redirect_to '/login' 
	end






end
