class LobbiesController < ApplicationController
  before_action :set_lobby, only: [:show, :edit, :update, :destroy]

  # GET /lobbies
  # GET /lobbies.json
  def index
    @lobbies = Lobby.all
  end

  # GET /lobbies/1
  # GET /lobbies/1.json
  def show
  end

  # GET /lobbies/new
  def new
    @lobby = Lobby.new
  end

  # GET /lobbies/1/edit
  def edit
  end

  # POST /lobbies
  # POST /lobbies.json
  def create
    @lobby = Lobby.new(lobby_params)

    respond_to do |format|
      if @lobby.save
        format.html { redirect_to @lobby, notice: 'Lobby was successfully created.' }
        format.json { render :show, status: :created, location: @lobby }
      else
        format.html { render :new }
        format.json { render json: @lobby.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lobbies/1
  # PATCH/PUT /lobbies/1.json
  def update
    respond_to do |format|
      if @lobby.update(lobby_params)
        format.html { redirect_to @lobby, notice: 'Lobby was successfully updated.' }
        format.json { render :show, status: :ok, location: @lobby }
      else
        format.html { render :edit }
        format.json { render json: @lobby.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lobbies/1
  # DELETE /lobbies/1.json
  def destroy
    @lobby.destroy
    respond_to do |format|
      format.html { redirect_to lobbies_url, notice: 'Lobby was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /lobbies/create_room
  def create_room
    lobby =  Lobby.create(lobby_params)
    story = Story.create(name: 'Untitled', author_id: params[:master_user_id], passage: '', editing: true, completed: false, likes: 0, views: 0)
    lobby.update(story_id: story.id)

    render json: lobby
  end

  # POST /lobbies/join/:id
  def join
    lobby = Lobby.find(params[:id])
    lobby.update(members: lobby.members+1)

    lobbyuser = LobbyUser.create(lobby_id: params[:id], user_id: params[:user_id])


    members = LobbyUser.where("lobby_id = ?", params[:id])

    ActionCable.server.broadcast("lobby_#{params[:id]}", {members: members, action: 'ActionJoin'})
    render json: lobbyuser
  end

  # POST /lobbies/leave/:id
  def leave
    lobby = Lobby.find(params[:id])

    if lobby.members-1 < 1
      lobby.destroy
    else
      lobby.update(members: lobby.members-1)
    end

    lobbyuser = LobbyUser.where(lobby_id: params[:id], user_id: params[:user_id])
    lobbyuser.destroy

    members = LobbyUser.where("lobby_id = ?", params[:id])

    ActionCable.server.broadcast("lobby_#{params[:id]}", {members: members, action: 'ActionLeave'})
    render json: { status: :ok}

  end

  # POST /lobbies/search/:query
  def search
    lobbies = Lobby.where("LOWER(name) LIKE ?", '%' + params[:query].downcase + '%')

    render json: lobbies
  end

  # POST /lobbies/members/:id
  def members
    members = LobbyUser.where("lobby_id = ?", params[:id])

    render json: members
  end

  # POST /lobbies/rename/:id
  def rename
    lobby = Lobby.find(params[:id])
    story = Story.find(lobby.story_id)
    story.update(name: params[:name])

    ActionCable.server.broadcast("lobby_#{params[:id]}", {story: story, action: 'ActionRename'})
    render json: { status: :ok}
  end

  # POST /lobbies/complete/:id
  def complete
    lobby = Lobby.find(params[:id])
    story = Story.find(lobby.story_id)
    story.update(editing: false, completed: true)
    lobby.update(story_id: nil)

    ActionCable.server.broadcast("lobby_#{params[:id]}", {lobby: lobby, action: 'ActionComplete'})

    render json: { status: :ok}
  end

  # POST /lobbies/abandon/:id
  def abandon
    lobby = Lobby.find(params[:id])
    story = Story.find(lobby.story_id)
    story.update(editing: false, completed: false)
    lobby.update(story_id: nil)

    ActionCable.server.broadcast("lobby_#{params[:id]}", {lobby: lobby, action: 'ActionAbandon'})

    render json: { status: :ok}
  end

  # POST /lobbies/edit_password/:id
  def edit_password
    lobby = Lobby.find(params[:id])

    if params[:password].empty?
      lobby.update(has_password: false, password: '')
    else
      lobby.update(has_password: true, password: params[:password])
    end

    ActionCable.server.broadcast("lobby_#{params[:id]}", {lobby: lobby, action: 'ActionEditPassword'})

    render json: { status: :ok}
  end

  # POST /lobbies/append_story/:id
  def append_story
    lobby = Lobby.find(params[:id])
    story = Story.find(lobby.story_id)
    passage = story.passage
    passage << ' ' << params[:story_input]
    story.update(passage: passage)

    ActionCable.server.broadcast("lobby_#{params[:id]}", {story: story, action: 'ActionAppendStory'})

    render json: { status: :ok}
  end

  # POST /lobbies/select_story/:id
  def select_story
    lobby = Lobby.find(params[:id])
    lobby.update(story_id: params[:story_id])

    ActionCable.server.broadcast("lobby_#{params[:id]}", {lobby: lobby, action: 'ActionSelectStory'})

    render json: { status: :ok}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lobby
      @lobby = Lobby.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lobby_params
      params.require(:lobby).permit(:name, :story_id, :has_password, :password, :word_limit, :master_user_id, :members)
    end
end
