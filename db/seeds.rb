# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

helloworld = Post.create!(title: "hello", content: 'world', user_id: 1)
Comment.create!(content: 'this is a hello world?', post_id: helloworld.id)
