## [Hacker School Confessional](http://i.imgur.com/yVqvE.gif) ![Favicon](http://i.imgur.com/1oKgf.png "favicon")

An anonymous confessional booth for hacker schoolers to sound off and communicate with one another. Within the first three hours of my sharing the product with hacker school in our IRC channel, over 30 confessions were made and over 200 reactions were posted. Three days after its release, the Hacker School Confessional was brought down at the request of Hacker School faculty. Anonymity has a tendency to breed controversy :). There were over 75 confessions and over 350 comments at the time of take-down.

While it was up, the Hacker School Confessional received approximately 50 unique visitors per day (i.e. virtually all of Hacker School), with an average of 9.83 page views per visit and an average visit duration of 7:39.

![Hacker School Confessional screenshot](http://i.imgur.com/e6OBE.gif "gone forever")

## Features ## {#features}
* An active users counter (see "X sinners in the booth in the top right corner")
* Pagination [Figure 1](#pagination).
* Link to comment numbers by typing e.g. "#2" in the body of your reply. ![link to comments](http://i.imgur.com/sceMm.png "so fancy.")

#### Figure 1 ### {#pagination}
![pagination](http://i.imgur.com/Pzi0z.png "7 pages wow!")
[Back to Features](#features)

Note to self: if the production db ever needs to be replaced with the local db, you must first switch to ruby 1.9.2, since this is the version that heroku uses. Using 1.9.3 will result in errors. So, type the command "rvm use ruby-1.9.2-p290@heroku-db-push-gemset", then run "heroku db:push". Then delete all local cookies and the site should have the db replaced! Lastly, switch back to your previous gemset.