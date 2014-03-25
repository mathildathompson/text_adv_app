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
user.username = "Nizmox"
user.email = "test@test.com"
user.password = "test1234"
user.password_confirmation = "test1234"
user.save

#----------------------------------------

adv = user.adventures.new(:name => 'End of Days', :status => 'Draft')
adv.description = "A post apocalyptic adventure that's fun for the whole family! Including Cannibals, Slavers and Mutants!"
adv.image = 'http://www.secretsofthefed.com/wp-content/uploads/2013/06/Post-Apocalypse-London.jpg'
adv.user_id = user.id
adv.save

#----------------------------------------

scene = adv.scenes.new
scene.title = "Ruined City"
scene.description = "After several hours journey you arrive on the outskirts of a ruined city. Hundreds of ruined skyscrapers lay ahead of you. You stare down the main road believing you can see movement in the distance. \"We should search the ruins for supplies before venturing further\" says Joshua."
scene.image = "http://i179.photobucket.com/albums/w292/koberko/Ruined%20city%20-%20WIP/scena_test_003.jpg"
scene.end = false
scene.save

scene2 = adv.scenes.new
scene2.title = "On the Road"
scene2.description = "As you walk down the road, you see a group of 5 approaching you. As you get closer you know they mean business. The five standing in front of you are armed and looking for a fight, two have automatic weapons, one has a machete and the other two appear to have concealed weapons"
scene2.image = "http://media.npr.org/assets/img/2012/08/29/the-day-movie-image-1_wide-77377d00ddd66ee3b1bf3895258d617f4d5e3899-s6-c30.jpg"
scene2.end = false
scene2.save

#set the start scene
adv.start_scene_id = scene.id
adv.save

#----------------------------------------

track = Track.new
track.link(scene, scene2, "Walk down the road")

track2 = Track.new
track2.link(scene2, scene, "Flee to the city outskirts")

#----------------------------------------
#- ADVENTURE SEED END
#----------------------------------------

adv2 = user.adventures.new(:name => 'No-one No-where', :status => 'Draft')
adv2.description = "What if you woke up and the entire world had vanished without a trace?"
adv2.image = 'http://i.dailymail.co.uk/i/pix/2011/09/04/article-2033551-0DB21EA400000578-387_964x642.jpg'
adv2.save

#----------------------------------------

scene3 = adv2.scenes.new
scene3.title = "The bedroom"
scene3.description = "You open your eyes and glance round the room. Rock band posters line the walls of bands you haven't liked or listened to in years. But your parents liked it this way, it gave them the sense that their baby still lives at home. *yuck!*"
scene3.image = "http://uglyhousephotos.com/wordpress/wp-content/uploads/2011/01/110107a.jpg"
scene3.end = false
scene3.save

#set the starting scene
adv2.start_scene_id = scene3.id
adv2.save

######REMOVE THESE!!!!######
# scene3.first_visit = ""
# scene3.multi_visit = true




