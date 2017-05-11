class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)
    if @user.save
      flash[:notice] = "Account created. Please log in now."
      redirect_to @user
    else
      flash[:alert] = "Error creating account: #{@user.errors.messages}"
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(strong_params)
    if @user.save
      flash[:notice] = "Account is updated successfully."
      redirect_to @user
    else
      flash[:alert] = "Error updating user: #{@user.errors.messages}"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Account is deleted"
      redirect_to "/statuses"
    else

    end
  end

  private
  def strong_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end