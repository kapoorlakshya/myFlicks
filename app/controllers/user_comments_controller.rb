class UserCommentsController < ApplicationController
  before_action :set_user_comment, only: [:show, :edit, :update, :destroy]

  # GET /user_comments
  # GET /user_comments.json
  def index
#    @user_comments = UserComment.all
    redirect_to root_url
  end

  # GET /user_comments/1
  # GET /user_comments/1.json
  def show
  end

  # GET /user_comments/new
  def new
    @user_comment = UserComment.new
    if params[:imdb_datum_id]
      @user_comment.user_id = current_user.id
      @user_comment.user_email = current_user.email
      @user_comment.imdb_datum_id = params[:imdb_datum_id]
    end
  end

  # GET /user_comments/1/edit
  def edit
  end

  # POST /user_comments
  # POST /user_comments.json
  def create
    @user_comment = UserComment.new(user_comment_params)

    flick_url = user_comment_params["imdb_datum_id"]

    if  user_comment_params["comment"] != nil && user_comment_params["comment"] != "" 
      if @user_comment.save
        redirect_to("/imdb_data/#{flick_url}")
      end
    else
      flash[:notice] = "You cannot post a blank comment."
      redirect_to("/imdb_data/#{flick_url}")
    end

=begin
    respond_to do |format|
      if @user_comment.save
        format.html { redirect_to @user_comment, notice: 'User comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_comment.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /user_comments/1
  # PATCH/PUT /user_comments/1.json
  def update
      if @user_comment.update(user_comment_params)
        flick_url = user_comment_params["imdb_datum_id"]
        redirect_to("/imdb_data/#{flick_url}")
      end
=begin
    respond_to do |format|
    #    format.html { redirect_to @user_comment, notice: 'User comment was successfully updated.' }
    #    format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_comment.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /user_comments/1
  # DELETE /user_comments/1.json
  def destroy
    @user_comment.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Your comment was deleted!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_comment
      @user_comment = UserComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_comment_params
      params.require(:user_comment).permit(:user_id, :user_email, :imdb_datum_id, :comment)
    end
end
