rails g scaffold Story name:string author_id:integer passage:text editing:boolean completed:boolean likes:integer
rails g scaffold Lobby name:string has_password:boolean password:string word_limit:integer master_user_id:integer members:integer
rails g scaffold LobbyMessage message:text lobby_id:integer user_id:integer
rails g scaffold LibraryComment comment:text likes:integer story_id:integer user_id:integer
rails g scaffold ChatMessage message:text sender_id:integer recipient_id:integer
rails g migration CreateJoinTableUserLobby user lobby
rails g migration CreateJoinTableUserStory user story
rails g migration CreateJoinTableUserUser user user