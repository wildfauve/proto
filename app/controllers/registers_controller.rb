class RegistersController < ApplicationController
  
  respond_to :html, :json
  
  # GET /members/1/registers
  def index
    Rails.logger.info(">>>Register Controller>>Index: #{params.inspect}")
    @member = Member.find(params[:member_id])
    respond_with do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1/register
  def create
    @member = Member.find(params[:member_id])
    respond_with do |format|
      if @member.update_attributes(:registered => true, :reg_date => Time.now)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
  end
  
  def new
  end
  
  # DELETE /members/1/register
  def destroy
    @member = Member.find(params[:member_id])
    respond_with do |format|
      if @member.update_attributes(:registered => false, :reg_date => nil)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end
end
