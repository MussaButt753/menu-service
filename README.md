# Overview
The Menu Service with GraphQL is a Rails application that provides a flexible and powerful way to manage menus, sections, items, and modifiers through a GraphQL API. This service enables you to create, update, delete, and query menu-related data with ease.

# Features

## CRUD Operations: 
Perform Create, Read, Update, and Delete operations on menus, sections, items, and modifiers.

## GraphQL API:
Interact with the service using a GraphQL API, allowing for precise queries and mutations tailored to your needs.


# Getting Started
* Ruby version: 3.3.1

* Setup Instructions:
  * Clone the Repository: Clone the repository to your local machine using git clone.
  * Build docker image: You can build the docker image using `docker-compose build`
  * Setup database: Set up the database by running `docker-componse run --rm api rails db:setup`
  * Start server: Start your server using this command `docker-compose up -d`
  * Explore the GraphQL API: Visit `http://0.0.0.0:3000/graphiql` to access the GraphQL playground and start exploring the API.

* How to run the test suite: `docker-compose run --rm api bundle exec rspec`

* Deployment instructions

* 
