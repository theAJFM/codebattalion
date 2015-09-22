# Codebattalion

## WTH?

A competitive programming site fully built on top of ruby. Fueled significantly by the Dropbox API (Can't afford an S3 account just yet). Currently only supports ruby and python submissions (Java doesn't work... yet)

## What's available here...

Some features that you commonly find in competitive programming sites, like leaderboard, problem submission, problem creation, and a text editor. Submission viewing is unfortunately not available at the moment. 

## For Windows users

You're out of luck. This doesn't work at all on a machine with Windows 8 or above. Every submission needs to be limited with timeouts and so far, I only figure out how to do this by capturing kernel ticks. Pretty sure that most modern Windows OS, including Windows 8 and 10, use tickless kernel.

To try out this app, just do the following:

1. Install ruby + rails if you haven't.
2. Some seeds are available for the db, you can choose to modify it and reset the whole migration. Otherwise, just skip this part.
3. Get a Dropbox account and connect this app to your account to get an API key.
4. Run the server using the 'rails s' command.
5. Enjoy!
