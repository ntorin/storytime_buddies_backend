class LobbyMessagesController < ApplicationController
  before_action :set_lobby_message, only: [:show, :edit, :update, :destroy]

  # GET /lobby_messages
  # GET /lobby_messages.json
  def index
    @lobby_messages = LobbyMessage.all
  end

  # GET /lobby_messages/1
  # GET /lobby_messages/1.json
  def show
  end

  # GET /lobby_messages/new
  def new
    @lobby_message = LobbyMessage.new
  end

  # GET /lobby_messages/1/edit
  def edit
  end

  # POST /lobby_messages
  # POST /lobby_messages.json
  def create
    @lobby_message = LobbyMessage.new(lobby_message_params)

    respond_to do |format|
      if @lobby_message.save
        format.html { redirect_to @lobby_message, notice: 'Lobby message was successfully created.' }
        format.json { render :show, status: :created, location: @lobby_message }
      else
        format.html { render :new }
        format.json { render json: @lobby_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lobby_messages/1
  # PATCH/PUT /lobby_messages/1.json
  def update
    respond_to do |format|
      if @lobby_message.update(lobby_message_params)
        format.html { redirect_to @lobby_message, notice: 'Lobby message was successfully updated.' }
        format.json { render :show, status: :ok, location: @lobby_message }
      else
        format.html { render :edit }
        format.json { render json: @lobby_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lobby_messages/1
  # DELETE /lobby_messages/1.json
  def destroy
    @lobby_message.destroy
    respond_to do |format|
      format.html { redirect_to lobby_messages_url, notice: 'Lobby message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send
    lobby_message = LobbyMessage.create(params[:message], params[:lobby_id], params[:user_id])
    ActionCable.server.broadcast("lobby_#{params[:lobby_id]}", lobby_message)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lobby_message
      @lobby_message = LobbyMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lobby_message_params
      params.require(:lobby_message).permit(:message, :lobby_id, :user_id)
    end
end
