class PagesController < ApplicationController

  def index
    unless cookies[:visitor]
      @visitor = Visitor.create()
      cookies[:visitor] = { value: @visitor.id, expires: 1.year.from_now }
    end
    @inquiry = Inquiry.new
  end

end