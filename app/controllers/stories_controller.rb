class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /stories/retrieve
  # sort: recent, popular
  # offset: starting point
  # limit: ending point
  # query: search query
  def retrieve
    sort = 'created_at ASC'

    case params[:sort]
      when 'recent'
        sort = 'created_at ASC'
      when 'popular'
        sort = 'views ASC'
      else

    end

    stories = Story.where("LOWER(name) LIKE ?", '%' + params[:query].downcase + '%').order(sort).offset(params[:offset]).limit(params[:limit])

    render json: stories
  end

  # POST /stories/like/:id
  def like
    like = StoryLike.where("story_id = ? AND user_id = ?", params[:id], params[:user_id])

    if like.blank?
      story = Story.where("id = ?", params[:id])
      story.likes += 1

      StoryLike.create(params[:id], params[:user_id])
    else
      story = Story.where("id = ?", params[:id])
      story.likes -= 1

      like.first.destroy
    end

    render json: { status: :ok}
  end

  # POST /stories/display/:id
  def display
    story = Story.where("id = ?", params[:id])
    like = StoryLike.where("story_id = ? AND user_id = ?", params[:id], params[:user_id])

    is_liked = true
    if like.blank?
      is_liked = false
    end

    render json: {story: story, is_liked: is_liked}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:name, :author_id, :passage, :editing, :completed, :likes)
    end
end
