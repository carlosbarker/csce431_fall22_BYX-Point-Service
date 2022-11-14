# README

This README contains information about the BYX-Point-Service web app regarding what tools were used, installation, how to deploy, and how to execute.

# Introduction

This application is for use by the BYX(Beta Upsilon Chi) organization.<br>
The application uses account authentication with a tamu email to distinguish between officers and members of the organization.<br>
BYX officers can track and modify attendance and service points for their members, as well as create/edit/delete member accounts, <br>
furthermore officers can also create/edit/delete organizetion events that are output to a calendar.<br>
BYX members can see their attendance and service points, as well as see upcoming events on a calendar when they are logged in.

# Requirements

This code has been run and tested on:

* Ruby
* Rails
* Ruby Gems - Listed in Gemfile
* PostgreSQL

# External Deps

* Docker
* Heroku CLI
* Git

# Installation

Install Docker Desktop

Run the following

`docker pull dmartinez05/ruby_rails_postgresql:latest`

Download this code repository by using git:

git clone [https://github.com/carlosbarker/csce431_fall22_BYX-Point-Service.git](https://github.com/carlosbarker/csce431_fall22_BYX-Point-Service.git)

Tests

* rspec spec
* Brakeman
* SimpleCov
* Rubocop

# Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`cd your_github_here`

`docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

For Windows (PowerShell):

`docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

`cd rails_app`

For Windows:

`cd csce431`

Install the app

`bundle install && rails webpacker:install && rails db:create && rails db:migrate`

Run the app

`rails server --binding=0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

If you are having issues logging in, it most likely is because your database is empty. In this case, run:

`rails db:seed`

The app is designed to not allow a person to log in unless their email can be found in the Members table.

# Google OAuth2 Environment Variables

Google OAuth2 uses two environment variables to work:

`GOOGLE_OAUTH_CLIENT_ID`

`GOOGLE_OAUTH_CLIENT-SECRET`

Setting these in a ".env" file *does not* work. Instead, you must pass these parameters when launching the Docker image:

`-e GOOGLE_OAUTH_CLIENT_ID=<ID> -e GOOGLE_OAUTH_CLIENT_SECRET=<SECRET>`

You can double check these variables have been passed successfully under the Inspect tab of the running container in Docker Desktop.

If deploying to Heroku, you must set these environment variables manually in the Heroku Dashboard or CLI.
Dashboard: app > Settings > Reveal Config Vars > Add

If you do not pass these variables when running locally, the app will run offline using a mock account and will not access Google servers. Note that the app *needs* these environment variables when running in production (i.e., running offline is not an option).

# Deployment

To deploy to Heroku:Create pull request in Github from new branch to merge to master

* Review app in Heroku automatically created for branch with pull request
* Check review app for functionality
* Approve pull request and merge to master
* Deployed production app automatically recreated with new master

# CI/CD

CI - Github Actions
CD - Heroku pipeline for automatic deployment for review apps and production apps

# Support

There will be a link to a support page on the BYX app that BYX members can use if they encounter issues with the app. <br>On the support page users can contact the development team to report any issues, look at a demo of the application and read the documentation concerning the project. 

# References/Credits

* [Google OAuth for Ruby On Rails. Implementing sign in with Gmail account… | by Amos Choo | Medium](https://medium.com/@amoschoo/google-oauth-for-ruby-on-rails-129ce7196f35)
* [How to add Google Sign In (SSO) with Devise to a Ruby on Rails 7 App | by Quan Nguyen | Dev Genius](https://blog.devgenius.io/how-to-add-google-sign-in-sso-with-devise-to-a-ruby-on-rails-7-app-6d8c5ef7641b)
* [Google OAuth + Rails 5 using Devise and OmniAuth | by Adam Langsner | Medium](https://medium.com/@adamlangsner/google-oauth-rails-5-using-devise-and-omniauth-1b7fa5f72c8e)
