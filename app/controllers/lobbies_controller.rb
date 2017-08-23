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

  # POST /lobbies/join/:id
  def join
    lobby = Lobby.find(params[:id])
    lobby.update(members: lobby.members+1)

    lobbyuser = LobbyUser.create(lobby_id: params[:id], user_id: params[:user_id])


    render json: lobbyuser
  end

  # POST /lobbies/leave/:id
  def leave
    lobby = Lobby.find(params[:id])
    lobby.update(members: lobby.members-1)

    lobbyuser = LobbyUser.where(lobby_id: params[:id], user_id: params[:user_id])
    lobbyuser.destroy

    render json: lobby

  end

  # POST /lobbies/search/:query
  def search
    lobbies = Lobby.where("LOWER(name) LIKE ?", '%' + params[:query].downcase + '%')

    render json: lobbies
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lobby
      @lobby = Lobby.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lobby_params
      params.require(:lobby).permit(:name, :has_password, :password, :word_limit, :master_user_id, :members)
    end
end
