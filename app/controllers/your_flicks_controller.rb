class YourFlicksController < ApplicationController
  before_action :set_your_flick, only: [:show, :edit, :update, :destroy]

  # GET /your_flicks
  # GET /your_flicks.json
  def index
    data_array = Array.new
    ImdbDatum.all.each { |f|
      data_array.push(f)
    }

    @imdb_data = data_array.uniq
    @flicks = Flick.all
    @your_flicks = Array.new

    @flicks.each do |f|
      if current_user.id == f.user_id
        @your_flicks.push(f)
      end
    end

  end

  # GET /your_flicks/1
  # GET /your_flicks/1.json
  def show
  end

  # GET /your_flicks/new
  def new
    @your_flick = YourFlick.new
  end

  # GET /your_flicks/1/edit
  def edit
  end

  # POST /your_flicks
  # POST /your_flicks.json
  def create
    @your_flick = YourFlick.new(your_flick_params)

    respond_to do |format|
      if @your_flick.save
        format.html { redirect_to @your_flick, notice: 'Your flick was successfully created.' }
        format.json { render action: 'show', status: :created, location: @your_flick }
      else
        format.html { render action: 'new' }
        format.json { render json: @your_flick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /your_flicks/1
  # PATCH/PUT /your_flicks/1.json
  def update
    respond_to do |format|
      if @your_flick.update(your_flick_params)
        format.html { redirect_to @your_flick, notice: 'Your flick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @your_flick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /your_flicks/1
  # DELETE /your_flicks/1.json
  def destroy
    @your_flick.destroy
    respond_to do |format|
      format.html { redirect_to your_flicks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_your_flick
      @your_flick = YourFlick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def your_flick_params
      params[:your_flick]
    end
end
