class OffersController < ApplicationController
  
  respond_to :html, :json
  
  # GET /members/1/offers
  # Provides a list of the Member's Current Offers
  def index
    @member = Member.find(params[:member_id])
    @products = @member.products
  end
  
  def show
    @product = Product.find(params[:id])
    Log.make(session[:mem_id], {:product => @product.id, :action => :click, :type => :offer})
    respond_with do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  
  end
  
  
  
end
