class StatusesController < ApplicationController

  def new
  	@status = Status.new
  end

  def create
  	@status = Status.new(status_params)
  	if @status.save
  	  flash[:notice] = "Status is created successfully."
  	  redirect_to status_path(@status.id)
  	else
  	  flash[:alert] = "Error creating status."
  	  render :new
  	end
  end

  def edit
  end

  def update
  	@status = Status.find(params[:id])
    if @status.update(status_params)
      flash[:notice] = "Status is updated successfully."
	  redirect_to @status
    else
  	  render :edit
  	end
  end

  def destroy
  	@status = Status.find(params[:id]).destroy
  	flash[:notice] = "Status is deleted."
  	redirect_to statuses_path
  end

private

 def status_params
   params.require(:status).permit(:title, :content)
 end


end