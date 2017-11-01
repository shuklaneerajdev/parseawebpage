# README

This is a basic application which takes a URL, parses it and then stores the h1, h2, h3 and links for it which can be shown to the user.

* There is corresponding JSON endpoint for each element.

For running this application, just checkout database.yml file and either create the corresponding database and user credentials.
Then you can run
bundle exec rake db:migrate

Then run
rails s

and you are good to go. Visit http://localhost:3000 to parse the webpage that you would like.


* There are a few limitations of the app. The parsing is done in the model of the application, which can timeout in case of a really big webpage and that can be moved to something like Sidekiq.

* Sometimes the http or https redirection for a page is not allowed, so that case can be handled.
