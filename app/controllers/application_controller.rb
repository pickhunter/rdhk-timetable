class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :confirm_logged_in
  helper_method :show_logout? 

  def current_user
  	@current_user ||= User.find(session[:user_id])
  	if session[:user_id]
  	end
  end	

  def show_logout?
    unless session[:user_id]
      return false
    else
      return true
    end    
  end

  def require_user 
    unless current_user
  redirect_to '/login'  
  end
   end

 # to confirm and redirect if req
   def confirm_logged_in
    unless session[:user_id]
      flash[:danger] = "Please log in"
      redirect_to(:controller => 'sessions' , :action => 'new')
      return false
    else
      return true
    end
    
   end



  
end
