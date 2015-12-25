class InquiriesController < ApplicationController

  def create
    inquiry = Inquiry.new(inquiry_params)
    inquiry.visitor_id = session[:visitor]
    inquiry.save!
    @result = Inquiry.search_results(params[:inquiry][:address])
    @address = params[:inquiry][:address]
    render :show
  end

  def show

  end

  def lead_submit

  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:address)
  end

  def date_sell_params
    params.require(:date_sell).permit(:goal_date, :input_date)
  end
end