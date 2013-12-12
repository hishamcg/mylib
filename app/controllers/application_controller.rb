class ApplicationController < ActionController::Base
	  
	helper_method :current_user

	private

	def current_user
	  if session[:user_id]
	  	@current_user ||= User.find(session[:user_id])
	  else
	  	@current_user ||= User.new(name: 'Demo')
	  end 
	end

	def sign_in(user)
		session[:user_id] = user.id
	end

	def sign_out
		session.delete :user_id
	end
  
end	
