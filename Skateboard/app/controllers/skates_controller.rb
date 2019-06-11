class SkatesController < ApplicationController
  before_action :set_skate, only: [:show, :edit, :update, :destroy]

  # GET /skates
  # GET /skates.json
  def index
    @skates = Skate.all
  end

  # GET /skates/1
  # GET /skates/1.json
  def show
  end

  # GET /skates/new
  def new
    @skate = Skate.new
  end

  # GET /skates/1/edit
  def edit
  end

  # POST /skates
  # POST /skates.json
  def create
    @skate = current_user.skates.new(skate_params)
    
    respond_to do |format|
      if @skate.save
        format.html { redirect_to @skate, notice: 'Skate was successfully created.' }
        format.json { render :show, status: :created, location: @skate }
      else
        format.html { render :new }
        format.json { render json: @skate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skates/1
  # PATCH/PUT /skates/1.json
  def update
    respond_to do |format|
      if @skate.update(skate_params)
        format.html { redirect_to @skate, notice: 'Skate was successfully updated.' }
        format.json { render :show, status: :ok, location: @skate }
      else
        format.html { render :edit }
        format.json { render json: @skate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skates/1
  # DELETE /skates/1.json
  def destroy
    @skate.destroy
    respond_to do |format|
      format.html { redirect_to skates_url, notice: 'Skate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skate
      @skate = Skate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skate_params
      params.require(:skate).permit(:deck_brand, :trucks_brand, :model_year, :user_id)
    end
end
