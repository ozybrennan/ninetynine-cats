class CatRentalRequestsController < ApplicationController

  def new
    @request = CatRentalRequest.new
    @cats = Cat.all
  end

  def create
    @request = CatRentalRequest.new(req_params)
    @cats = Cat.all
    if @request.save
      redirect_to cat_url(req_params[:cat_id])
    else
      render :new
    end
  end

  def approve
    @request = CatRentalRequest.find(params[:cat_rental_request_id])
    @request.approve!
    redirect_to cat_url(@request.cat_id)
  end

  def deny
    @request = CatRentalRequest.find(params[:cat_rental_request_id])
    @request.deny!
    redirect_to cat_url(@request.cat_id)
  end

  private

  def req_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end


end
