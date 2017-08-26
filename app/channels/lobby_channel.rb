class LobbyChannel < ApplicationCable::Channel
  def subscribed
     stream_from "lobby_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
