rails g scaffold Story name:string passage:text editing:boolean completed:boolean likes:integer
rails g scaffold Lobby password:string word_limit:integer master_user_id:integer members:integer
rails g scaffold Message message:text lobby_id:integer user_id:integer
rails g scaffold LibraryComment comment:text likes:integer story_id:integer user_id:integer
rails g migration CreateJoinTableUserLobby user lobby
rails g migration CreateJoinTableUserStory user story