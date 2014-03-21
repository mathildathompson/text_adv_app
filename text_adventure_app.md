#Text Adventure App!

###Scope:-

A website to enable users to create, share and play text adventures. A text adventure is essential a series of scenes where users are presented with a series of choices and depending on their choice will move them to another scene. This creates a unique story each time the adventure is played.


###Object Models:-

User

* Username
* Password
* adventures[] - the adventures the user is creating
* games[]

Adventure

* name
* status: [Published,Draft] - available to play or not
* scenes[]
* Facebook API to share adventures

Scene

* Image
* First visit text (if not visited)
* Description
* Options => Links to other Scenes
* Multi visit y/n (does this option dissapear after first visit)
* End = Y or N (if Y, must restart the adventure)

Game (to save progress)

* current scene
* scenes visited
* items
* description? hair color etc...

###Relationships

Building an adventure:-
User has many adventures
Adventure has many scenes

Playing an adventure:-
A User has many games
A game is linked to a scene in an adventure (a save game so to speak)

- - -
##Design Idea

This idea is inspired by the old school pick-a-path books.
In summary you read a page, and that page presents a number of options to you. You choose an option by turning to a specific page in the book and this repeats. Ultimately this can lead to a good or bad outcome depending on your decisions.

These books were a lot of fun, but what's more fun is to allow others to create their own adventures and send them to their friends!

The web can enhance the storytelling by allowing images for a scene and possibly even music!

Popular adventures could trend on the front page?

- - -
##Challenges?

How will I map the adventure so it can be viewed when designing an adventure?

Something to find dead ends