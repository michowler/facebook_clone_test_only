class SessionsController < ApplicationController
  def new    
  end

  def create
    @user = User.find_by(email: params[:session][:email]).try(:authenticate, params[:session][:password])
    unless @user == nil || false
      flash[:notice] = "Welcome, #{@user.email}!"
      session[:user_id] = @user.id
      redirect_to "/statuses"
    else
      flash[:alert] = "Please log in again"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to "/"
  end
end
