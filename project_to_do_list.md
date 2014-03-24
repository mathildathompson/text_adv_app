#Project To Do List

###Bugs

* Deleteing a scene should redirect you to the current adventure

###Must Have

* When in scenes, Add a adventure name heading, with a link back to the adventure
* Refactor my 'Path' model to use origin_id instead of scene_id
* Add confirmation to deletes!
* If a scene is flagged as the end, delete all destinations?
* Prevent deletion of the opening scene - I have removed the link, but how to validate this?
* Track visited scenes, exclude scenes where multivisit = no
* Display 'Draft' adventures only for the creator, all users can see 'Published' adventures.

###Nice to Have

* Restrict users to only edit their own adventures
* Setup Game 'so progress is tracked and scenes visited are tracked'
* Prevent publishing an adventure if it has 'orphan scenes'

###Ask Instructors

* For scenes, New and Edit are quite similar, how to fix this? Forms differ slightly (in how it posts)
* How best to link to the first scene
* Can I use Cancan to lock down permissions on modifying content
* Setup the relationship for a scene to find it's origins
* Does the way my relationship model is named make sense? or should i use origin_id && destination_id