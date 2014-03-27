#Project To Do List

###Ask Joel

* Tracks Delete Buttons!!

###Must Have

* Fix the active highlighting on menu bar for my creations
* Force users to confirm their email address!
* Validate Status can ONLY be either Draft or Published
* Add a default image for new adventures if one is not provided
* Can't publish an adventure without at least ending!
* Readme.md (see below requirements)

Don't forget to update the/add a README file to your project!  README.md Projects need a readme file in markdown explaining their project. Explain your concept and data model. What problem are you solving? What gems and/or APIs are you using?
it's a good place to thank anyone who has been especially helpful with this project
*cough* Mathilda *cough*


##Styling

* Style the Cancel Account Button positioning?
* Update FAQ page
* Add Glyph Icons
* Set consistent page heading text and centre it
* Restyle Form for 'Create a New Track from this scene, to another scene'
* The adventure end message text and styling
* 404 Page

##Testing

* Check validations on models and links to delete!!!
* Changing user details

###Nice to Have

* Image - Resize automatically
* Devise should allow remembering the user and email password resets
* Comments form
* Searching for an adventure
* Edit a Track (the description)
* Map an Adventure (Scene > Track Desc > Scene)
* Itemisation, track which scenes visited, save progress
* Add Categories for adventures to filter by interest
* Track how many plays an Adventure gets and list top adventures on the home page
* Give Option to display titles or not on an adventure (when playing)

###How to introduce game states?

Firstly, to play a game all users would have to be logged in.

When you click 'Play Adventure', the scene will be loaded that matches your game 'current scene'  
If you do not have a game for that adventure, a new game will be created.  
Reaching an end point will delete your game state  
If you load a scene that doesn't match your current game you're kicked out to the start of the adventure.


- - -

#Challenges

* Complex model! Scene > Track > Scene and back again
* User based permissions = Can only edit their own content.
* State based permissions = Two states, draft and published. Prevent editing published adventures, prevent viewing of draft adventures.
* Menu bar highlighting being concise code!

