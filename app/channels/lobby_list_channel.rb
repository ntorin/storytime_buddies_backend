class LobbyListChannel < ApplicationCable::Channel
  def subscribed
     stream_from "lobbylist"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
