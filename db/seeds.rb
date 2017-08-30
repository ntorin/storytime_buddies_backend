# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |i|
  Story.create([{name: Faker::Book.title, author_id: 0, passage: Faker::Lorem.paragraph, editing: false,
                 completed: true, likes: Random.new(100)},
                {name: Faker::Book.title, author_id: 1, passage: Faker::Lorem.paragraph, editing: false,
                 completed: true, likes: Random.new(100)}])
  Lobby.create([{name: Faker::Coffee.blend_name, has_password: false, password: '', word_limit: Random.new(30),
                master_user_id: 0, members: 0, story_id: i},
                {name: Faker::Coffee.blend_name, has_password: true, password: 'test', word_limit: Random.new(30),
                 master_user_id: 1, members: 0, story_id: i}])
  5.times do |j|
    LibraryComment.create([{comment: Faker::Lorem.sentence, likes: Random.new(500), story_id: i, user_id: 0},
                           {comment: Faker::Lorem.sentence, likes: Random.new(500), story_id: i, user_id: 1}])
  end
end