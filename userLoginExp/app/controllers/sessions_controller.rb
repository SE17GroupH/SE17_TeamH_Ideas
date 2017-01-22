class SessionsController < ApplicationController

  # before_filter :set_failed_login_time
  # def set_failed_login_time
  #   @login_failed = 0
  # end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      open_page_time =  params[:session][:open_page_time].to_i
      login_time = DateTime.now.to_i
      time_difference = login_time - open_page_time
      user.update_columns(:open_page_at => open_page_time, :login_at => login_time, :time_difference =>time_difference)
      redirect_to user

    # else
    #   flash.now[:danger] = 'Invalid email/password combination'
    #   render 'new'
    elsif user
      flash.now[:danger] = 'Invalid email/password combination'
      # @login_failed = @login_failed + 1
      # p @login_failed
      # current_failed_times = user.select(:login_failed)
      # p current_failed_times+1
      # user.update_columns
      render 'new'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end
end