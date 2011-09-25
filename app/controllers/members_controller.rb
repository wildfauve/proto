class MembersController < ApplicationController
  
  respond_to :html, :json
  
  # GET /members
  # GET /members.json
  def index
    @members = Member.all

    respond_with do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_with do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_with do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_with do |format|
      if @member.save
        reg_id = url_for member_registers_path(@member)
        Rails.logger.info(">>>Member Controller>>CREATE: #{@member.inspect}")
        format.html { redirect_to @member, notice: "For Registration use: #{reg_id}." }
        format.json { render :jsonify => @member, :status => :created, :location => member_path(@member) }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_with do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_with do |format|
      format.html { redirect_to members_url }
      format.json { head :ok }
    end
  end
  
  # member resources
  
  def delete_all
    
    respond_with do |format|
      format.html {redirect_to members_url}
    end
    
  end
  
  
end
