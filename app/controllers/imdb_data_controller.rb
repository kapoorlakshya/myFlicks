class ImdbDataController < ApplicationController
  require 'open-uri'
  require 'json'
  require 'net/http'

  before_action :set_imdb_datum, only: [:show, :edit, :update, :destroy]

  # GET /imdb_data
  # GET /imdb_data.json
  def index
#    @imdb_data = ImdbDatum.all
    redirect_to root_url
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
    @imdb_datum = ImdbDatum.new(imdb_datum_params) # New movie entry
    imdb_value = imdb_datum_params["imdb_id"] # Movie title or IMDB id from the form

    if imdb_value.match(/tt+\d*/)
     url = URI.escape("http://www.omdbapi.com/?i=#{imdb_value}&plot=short")
    else
      url = URI.escape("http://www.omdbapi.com/?t=#{imdb_value}&plot=short")
    end

    buffer = open(url, "UserAgent" => "Ruby-Wget").read
    result = JSON.parse(buffer) # Parse JSON data to Hash

    if result["Response"] == "False"
      redirect_to new_imdb_datum_path, notice: "Incorrect title or ID. Please try again with a valid value."
    else

      unique_id = SecureRandom.hex # Unique ID binding the flick with the IMDB data
      @flick = Flick.new
      @flick.unique_id = unique_id
      @flick.user_id = current_user.id
      @flick.imdb_id = result["imdbID"]
      @flick.save

      if result["Poster"] == "N/A"
        imgur_link = "http://i.imgur.com/DTlIlng.png"
      else
        img = `curl --header "Authorization: Client-ID 7b8479c28beaf08" https://api.imgur.com/3/upload/?image=#{result["Poster"]}&type=URL`
        imgur_link = JSON.parse(img)["data"]["link"]
      end

      @imdb_datum.unique_id = unique_id
      @imdb_datum.imdb_id = result["imdbID"]
      @imdb_datum.title = result["Title"]
      @imdb_datum.year = result["Year"]
      @imdb_datum.release_date = result["Released"]
      @imdb_datum.runtime = result["Runtime"]
      @imdb_datum.genre = result["Genre"]
      @imdb_datum.rating = result["Rated"]
      @imdb_datum.imdbrating = result["imdbRating"]
      @imdb_datum.poster = imgur_link
      @imdb_datum.plot = result["Plot"]
      @imdb_datum.flick_type = result["Type"]
      @imdb_datum.director = result["Director"]
      @imdb_datum.writer = result["Writer"]
      @imdb_datum.actors = result["Actors"]
      @imdb_datum.save

      if @flick.save && @imdb_datum.save
        redirect_to your_flicks_path, notice: "#{@imdb_datum.title} (#{@imdb_datum.year}) was successfully added."
      else
        render 'new'
      end
    end

=begin
    respond_to do |format|
      if @imdb_datum.save
        format.html { redirect_to @imdb_datum, notice: '#{@imdb_datum.title} (#{@imdb.datum.year}) was successfully added.' }
        format.json { render action: 'show', status: :created, location: @imdb_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @imdb_datum.errors, status: :unprocessable_entity }
      end
    end
=end
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
      params.require(:imdb_datum).permit(:imdb_id)
    end
end
