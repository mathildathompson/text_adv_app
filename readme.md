#Text Adventure App!

- - -

###Scope:-

A website to enable users to create, share and play text adventures. A text adventure is essential a series of scenes where users are presented with a series of choices and depending on their choice will move them to another scene. This creates a unique story each time the adventure is played.

- - -

###Inspiration

This idea is inspired by the old school pick-a-path books.
In summary you read a page, and that page presents a number of options to you. You choose an option by turning to a specific page in the book and this repeats. Ultimately this can lead to a good or bad outcome depending on your decisions.

- - -

###Object Models:-

User

* username
* email
* password 

Adventure

* user_id - who created the adventure
* name - title for your adventure
* description - a summary of your adventure to encourage other users to play it
* image - a picture to represent your adventure
* status - the current state of your adventure, Draft or Published
* start_scene_id - what is the first scene in your adventure

Scene

* title - a very brief scene intro
* description - a description of the current scene (what is the situation)
* image_url - a url if your scene image is hotlinked
* image_file - to store the scene image if uploaded
* end - to flag if this scene is the end of your adventure
* adventure_id - which adventure does this scene belong to

Track
* origin_id - stores the from scene
* destionation_id - stores the to scene
* description - stores the description of how the player navigates from the origin to the destination


###Relationships

User -< Adventures -< Scenes

Scene >-< Scenes (through the tracks Model!)
(origin_id => destination_id)

###Gems
added for Heroku deployment  
- gem 'rails_12factor'

fix for Heroku deployment issue  
- gem 'thread_safe', '0.2.0'

prevent update to attributes  
- gem 'protected_attributes'

devise authentication  
- gem 'devise'

bootstrap styling  
- gem 'bootstrap-sass'

Gems for Amazon S3 Images  
- gem 'carrierwave'  
- gem 'dotenv-rails'  
- gem "fog", "~> 1.3.1"

###API
Amazon S3 and Carrierwave to allow users to upload their own image files

- - -

###Acknowledgements

**Joel Turnbull** - For helping me with countless problems faced throughout my project and keeping us entertained with his sense of humour.

**Mathilda Thompson** - For all her assistance in helping me get Carrierwave up and running despite my own stupidity.

**Erik Froese** - For creating me a hilarious adventure to use for my project demo! Check out "Rhialto's amazing journey"!

- - -