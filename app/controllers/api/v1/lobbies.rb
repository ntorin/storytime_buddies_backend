module API
  module V1
    class Lobbies < Grape::API
      include API::V1::Defaults

      resource :lobbies do
        desc "Return all lobbies"
        get "", root: :users do
          Lobby.all
        end

        desc "Return a lobby"
        params do
          requires :id, type: String, desc: "ID of the
            lobby"
        end
        get ":id", root: "user" do
          Lobby.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end