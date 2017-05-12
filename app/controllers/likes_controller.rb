class LikesController < ApplicationController

  def create
    @status = Status.find(params[:like][:status])

    unless Like.find_by(user_id: session[:user_id], status_id: @status.id).nil?
      flash[:alert] = "You liked before, don't spam!"
      redirect_to "/"
      return
    end

    @like = Like.new(user_id: session[:user_id], status_id: @status.id)
    if @like.save
      flash[:notice] = "You liked #{@status.title}!"
      redirect_to "/"
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @status = Status.find(@like.status_id)
    @like.destroy
    flash[:notice] = "You unlike your best friend's status."
    redirect_to @status
  end

end