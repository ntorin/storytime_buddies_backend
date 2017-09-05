class LibraryCommentsController < ApplicationController
  before_action :set_library_comment, only: [:show, :edit, :update, :destroy]

  # GET /library_comments
  # GET /library_comments.json
  def index
    @library_comments = LibraryComment.all
  end

  # GET /library_comments/1
  # GET /library_comments/1.json
  def show
  end

  # GET /library_comments/new
  def new
    @library_comment = LibraryComment.new
  end

  # GET /library_comments/1/edit
  def edit
  end

  # POST /library_comments
  # POST /library_comments.json
  def create
    @library_comment = LibraryComment.new(library_comment_params)

    respond_to do |format|
      if @library_comment.save
        format.html { redirect_to @library_comment, notice: 'Library comment was successfully created.' }
        format.json { render :show, status: :created, location: @library_comment }
        ActionCable.server.broadcast("lobby_#{@library_comment.story_id}", @library_comment)
      else
        format.html { render :new }
        format.json { render json: @library_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_comments/1
  # PATCH/PUT /library_comments/1.json
  def update
    respond_to do |format|
      if @library_comment.update(library_comment_params)
        format.html { redirect_to @library_comment, notice: 'Library comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @library_comment }
      else
        format.html { render :edit }
        format.json { render json: @library_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_comments/1
  # DELETE /library_comments/1.json
  def destroy
    @library_comment.destroy
    respond_to do |format|
      format.html { redirect_to library_comments_url, notice: 'Library comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /library_comments/retrieve/:story_id
  def retrieve
    comments = LibraryComment.where("story_id = ?", params[:story_id])

    render json: comments
  end

  # POST /library_comments/like/:id
  def like
    like = LibraryCommentLike.where("library_comment_id = ? AND user_id = ?", params[:id], params[:user_id])

    if like.blank?
      story = LibraryComment.where("id = ?", params[:id])
      story.likes += 1

      LibraryCommentLike.create(params[:id], params[:user_id])
    else
      story = LibraryComment.where("id = ?", params[:id])
      story.likes -= 1

      like.first.destroy
    end

    render json: { status: :ok}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library_comment
      @library_comment = LibraryComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def library_comment_params
      params.require(:library_comment).permit(:comment, :likes, :story_id, :user_id)
    end
end
