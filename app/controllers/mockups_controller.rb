class MockupsController < ApplicationController
  before_action :set_mockup, only: [:show, :edit, :update, :destroy]

  # GET /mockups
  # GET /mockups.json
  def index
    @mockups = Mockup.all
  end

  # GET /mockups/1
  # GET /mockups/1.json
  def show
  end

  # GET /mockups/new
  def new
    @mockup = Mockup.new
  end

  # GET /mockups/1/edit
  def edit
  end

  # POST /mockups
  # POST /mockups.json
  def create
    @mockup = Mockup.new(mockup_params)

    respond_to do |format|
      if @mockup.save
        format.html { redirect_to @mockup, notice: 'Mockup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mockup }
      else
        format.html { render action: 'new' }
        format.json { render json: @mockup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mockups/1
  # PATCH/PUT /mockups/1.json
  def update
    respond_to do |format|
      if @mockup.update(mockup_params)
        format.html { redirect_to @mockup, notice: 'Mockup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mockup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mockups/1
  # DELETE /mockups/1.json
  def destroy
    @mockup.destroy
    respond_to do |format|
      format.html { redirect_to mockups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mockup
      @mockup = Mockup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mockup_params
      params[:mockup]
    end
end
