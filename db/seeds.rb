# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Story.delete_all
StoryUser.delete_all
LibraryComment.delete_all
ChatMessage.delete_all
UserUser.delete_all
1.upto(10) do |i|

  Story.create([{name: Faker::Book.title, author_id: i, passage: Faker::Lorem.paragraph, editing: false,
                 completed: true, likes: Random.rand(0..100), views: Random.rand(0..1000)},
                {name: Faker::Book.title, author_id: i, passage: Faker::Lorem.paragraph, editing: false,
                 completed: false, likes: Random.rand(0..100), views: Random.rand(0..1000)}])

  StoryUser.create([{story_id: i, user_id: 1, username: 'User1'},
                    {story_id: i, user_id: 2, username: 'User2'},
                    {story_id: i, user_id: 3, username: 'User3'},
                    {story_id: i, user_id: 4, username: 'User4'},
                    {story_id: i, user_id: 5, username: 'User5'},
                    {story_id: i, user_id: 6, username: 'User6'},
                    {story_id: i, user_id: 7, username: 'User7'},
                    {story_id: i, user_id: 8, username: 'User8'},
                    {story_id: i, user_id: 9, username: 'User9'},
                    {story_id: i, user_id: 10, username: 'User10'},
                   ])
  2.upto(5) do |j|
    LibraryComment.create([{comment: Faker::Lorem.sentence, likes: Random.rand(0..500), story_id: i, user_id: j},
                           {comment: Faker::Lorem.sentence, likes: Random.rand(0..500), story_id: i, user_id: j}])
    ChatMessage.create([{message: 'Test message #' << i << ' from User' << j, sender_id: j, recipient_id: 1, connection_id: j - 1, username: 'User' << j},
                       ])
  end
end

UserUser.create([
                 {user_id: 1, friend_id: 2, username: 'User1', friendname: 'User2'},
                 {user_id: 1, friend_id: 3, username: 'User1', friendname: 'User3'},
                 {user_id: 1, friend_id: 4, username: 'User1', friendname: 'User4'},
                 {user_id: 1, friend_id: 5, username: 'User1', friendname: 'User5'},
                 {user_id: 1, friend_id: 6, username: 'User1', friendname: 'User6'},
                 {user_id: 1, friend_id: 7, username: 'User1', friendname: 'User7'},
                 {user_id: 1, friend_id: 8, username: 'User1', friendname: 'User8'},
                 {user_id: 1, friend_id: 9, username: 'User1', friendname: 'User9'},
                 {user_id: 1, friend_id: 10, username: 'User1', friendname: 'User10'},
                ])