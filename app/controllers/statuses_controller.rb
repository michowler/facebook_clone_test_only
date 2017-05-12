class StatusesController < ApplicationController

  def new
  	@status = Status.new
  end

  def create
  	@status = Status.new(status_params)
  	if @status.save
  	  flash[:notice] = "Status created successfully."
  	  redirect_to status_path(@status.id)
  	else
  	  flash[:alert] = @status.errors.full_messages
  	  render :new
  	end
  end

  def edit
  end

  def update
  	@status = Status.find(params[:id])
    if @status.update(status_params)
      flash[:notice] = "Status updated successfully."
	  redirect_to @status
    else
  	  render :edit
  	end
  end

  def destroy
  	@status = Status.find(params[:id]).destroy
  	flash[:notice] = "Status deleted."
  	redirect_to statuses_path
  end

private

 def status_params
   params.require(:status).permit(:title, :content)
 end


end