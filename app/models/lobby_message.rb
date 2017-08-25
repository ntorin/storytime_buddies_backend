class LobbyMessage < ApplicationRecord
  after_create :broadcast

  private

  def broadcast
    ActionCable.server.broadcast('lobby', as_json.merge(action: 'CreateLobbyMessage'))
  end
end
