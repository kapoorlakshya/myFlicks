class FlicksController < ApplicationController
  before_action :set_flick, only: [:show, :edit, :update, :destroy]

  # GET /flicks
  # GET /flicks.json
  def index
    @flicks = Flick.all   
  end

  # GET /flicks/1
  # GET /flicks/1.json
  def show
  end

  # GET /flicks/new
  def new
    @flick = Flick.new
    if params[:user_id]
      @flick.user_id = params[:user_id]
    else
      redirect_to root_url
    end
  end

  # GET /flicks/1/edit
  def edit
  end

  # POST /flicks
  # POST /flicks.json
  def create
#    @flick = Flick.new(flick_params)

    respond_to do |format|
      if @flick.save
        format.html { redirect_to @flick, notice: 'Flick was successfully created.' }
        format.json { render action: 'show', status: :created, location: @flick }
      else
        format.html { render action: 'new' }
        format.json { render json: @flick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flicks/1
  # PATCH/PUT /flicks/1.json
  def update
    respond_to do |format|
      if @flick.update(flick_params)
        format.html { redirect_to @flick, notice: 'Flick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @flick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flicks/1
  # DELETE /flicks/1.json
  def destroy
    @flick.destroy
    respond_to do |format|
      format.html { redirect_to flicks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flick
      @flick = Flick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flick_params
      params.require(:flick).permit(:user_id, :imdb_id)
    end
end
