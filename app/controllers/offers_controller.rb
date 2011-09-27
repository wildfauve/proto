class OffersController < ApplicationController
  
  # GET /members/1/offers
  # Provides a list of the Member's Current Offers
  def index
    @member = Member.find(params[:member_id])
    @products = @member.products
  end
  
end
