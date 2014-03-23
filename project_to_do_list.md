#Project To Do List

###Bugs

* Deleteing a scene should redirect you to the current adventure

###Must Have

* Prevent deletion of the opening scene - I have removed the link, but how to validate this?
* Prevent deletion of a scene if it has paths to other scenes??
* Add validations to models
* Track visited scenes, exclude scenes where multivisit = no
* Display 'Draft' adventures only for the creator, all users can see 'Published' adventures.

###Nice to Have

* Display a preview of each adventure when viewing
* Restrict users to only edit their own adventures
* Setup Game 'so progress is tracked and scenes visited are tracked'
* Prevent publishing an adventure if it has 'orphan scenes'

* Link a scene to an existing scene (allow mutli paths)
* Allow deletion of 'paths' but prevent deleting

###Ask Instructors

* For scenes, New and Edit are quite similar, how to fix this? Forms differ slightly (in how it posts)
* How best to link to the first scene
* Can I use Cancan to lock down permissions on modifying content
* Setup the relationship for a scene to find it's origins
* Does the way my relationship model is named make sense? or should i use origin_id && destination_id