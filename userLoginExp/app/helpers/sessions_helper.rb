module SessionsHelper
	#define log in method
	def log_in(user)
		session[:user_id] = user.id
	end

	#Define log out method
	def log_out
    	session.delete(:user_id)
    	@current_user = nil
  	end

	#getting the current user, return current user if can be found
	def current_user
  		@current_user ||= User.find_by(id: session[:user_id])
	end

	#returns true if logged in
	def logged_in?
    	!current_user.nil?
    end



end
