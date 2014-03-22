# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Adventure.destroy_all
Scene.destroy_all

user = User.new
user.email = "test@test.com"
user.password = "test1234"
user.password_confirmation = "test1234"
user.save

adv = Adventure.new(:name => 'End of Days', :status => 'Draft')
adv.description = "A post apocalyptic adventure that's fun for the whole family! Including Cannibals, Slavers and Mutants!"
adv.save

scene = Scene.new
scene.title = "Barren Wastes"
scene.first_visit = "After several hours journey you arrive on the outskirts of a ruined city. Hundreds of ruined skyscrapers lay ahead of you"
scene.description = "You stare down the main road believing you can see movement in the distance. \"We should search the ruins for supplies before venturing further\" says Joshua."
scene.image = "http://i179.photobucket.com/albums/w292/koberko/Ruined%20city%20-%20WIP/scena_test_003.jpg"
scene.end = false
scene.multi_visit = true
scene.save

scene2 = Scene.new
scene2.title = "On the Road"
scene2.first_visit = "As you walk down the road, you see a group of 5 approaching you. As you get closer you know they mean business"
scene2.description = "The five standing in front of you are armed and looking for a fight, two have automatic weapons, one has a machete and the other two appear to have concealed weapons"
scene2.image = "http://media.npr.org/assets/img/2012/08/29/the-day-movie-image-1_wide-77377d00ddd66ee3b1bf3895258d617f4d5e3899-s6-c30.jpg"
scene2.end = false
scene2.multi_visit = true
scene2.save

#link user tp adventure to scenes
user.adventures << adv
adv.scenes << scene
adv.scenes << scene2

#create scene to scene relationship
scene.destinations << scene2

path = scene.paths.first
path.description = "Walk down the road?"
path.save



