class ImdbDataController < ApplicationController
  before_action :set_imdb_datum, only: [:show, :edit, :update, :destroy]

  # GET /imdb_data
  # GET /imdb_data.json
  def index
    @imdb_data = ImdbDatum.all
  end

  # GET /imdb_data/1
  # GET /imdb_data/1.json
  def show
  end

  # GET /imdb_data/new
  def new
    @imdb_datum = ImdbDatum.new
  end

  # GET /imdb_data/1/edit
  def edit
  end

  # POST /imdb_data
  # POST /imdb_data.json
  def create
    @imdb_datum = ImdbDatum.new(imdb_datum_params)

    respond_to do |format|
      if @imdb_datum.save
        format.html { redirect_to @imdb_datum, notice: 'Imdb datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @imdb_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @imdb_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imdb_data/1
  # PATCH/PUT /imdb_data/1.json
  def update
    respond_to do |format|
      if @imdb_datum.update(imdb_datum_params)
        format.html { redirect_to @imdb_datum, notice: 'Imdb datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @imdb_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imdb_data/1
  # DELETE /imdb_data/1.json
  def destroy
    @imdb_datum.destroy
    respond_to do |format|
      format.html { redirect_to imdb_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imdb_datum
      @imdb_datum = ImdbDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imdb_datum_params
      params.require(:imdb_datum).permit(:imdb_id, :title, :year, :release_date, :runtime, :genre, :plot, :poster, :rating, :type)
    end
end
