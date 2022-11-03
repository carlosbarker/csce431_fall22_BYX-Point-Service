# README

This README contains information about the BYX-Point-Service web app regarding what tools were used, installation, how to deploy, and how to execute.

# Introduction

Application Description

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

Download this code repository by using git:

git clone [https://github.com/your_github_here.git
](https://github.com/carlosbarker/csce431_fall22_BYX-Point-Service)

# Tests

* rspec spec
* Brakeman
* SimpleCov

# Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

cd your_github_here

docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest

For Windows:

docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest

cd rails_app

Install the app

bundle install && rails webpacker:install && rails db:create && rails db:migrate

Run the app

**rails server --binding=0.0.0.0**

The application can be seen using a browser and navigating to http://localhost:3000/

# Deployment

To deploy to Heroku:

* Create pull request in Github from new branch to merge to master
* Review app in Heroku automatically created for branch with pull request
* Check review app for functionality
* Approve pull request and merge to master
* Deployed production app automatically recreated with new master

# CI/CD

CI - Github Actions
CD - Heroku pipeline for automatic deployment for review apps and production apps

# Support

Users looking for assistance should reach out to development team.
