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

adv = Adventure.create(:name => 'End of Days', :status => 'Draft')

scene = Scene.new
scene.title = "Barren Wastes"
scene.first_visit = "After several hours journey you arrive on the outskirts of a ruined city. Hundreds of ruined skyscrapers lay ahead of you"
scene.description = "You stare down the main road believing you can see movement in the distance. \"We should search the ruins for supplies before venturing further\" says Joshua."
scene.image = "http://i179.photobucket.com/albums/w292/koberko/Ruined%20city%20-%20WIP/scena_test_003.jpg"
scene.end = false
scene.multi_visit = true
scene.save

user.adventures << adv
adv.scenes << scene


