# Shopify Developer Intern Challenge (Backend) - Fall 2022

## Table of Contents
- [Problem Requirements](#problem-requirements)
- [Set Up](#set-up)
   - [Using Local Machine](#using-local-machine)
   - [Using Replit](#using-replit) * RECOMMENDED *
- [Database Structure](#database-structure)
- [How to Use](#how-to-use)
  - [Products](#products)
  - [Shipments](#shipments)
- [Next Steps](#next-steps)

## Problem Requirements
The initial task was to build an inventory tracking web application for a logistics company which met the following requirements.

Basic CRUD Functionality:
- Create inventory items
- Edit inventory items
- Delete inventory items
- View a list of all inventory items

One additional feature, of which I chose:
- Ability to create "shipments" and assign inventory to the shipment, and adjust inventory appropriately

## Set Up
### Using Local Machine
If you would like to run the web app on your local machine you will first need to install [Ruby](https://guides.rubyonrails.org/v5.0/getting_started.html), [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html), and [PostgreSQL](https://medium.com/geekculture/postgresql-rails-and-macos-16248ddcc8ba).

Once you have Ruby on Rails and PostgreSQL set up, clone the repo into a fresh directory and run:

```bundle install```

To install all of the gem dependencies for the project.

After the gem dependencies have been installed, you may create, migrate, and seed the database with the default schema and some example records by running:

```rails db:create db:migrate db:seed```

Once the database has been set up, you should be able to access the web application by starting up a server using:

```rails s```

And opening a browser and navigating to:

```http://localhost:3000/```

### Using Replit
Replit provides an easy way to 
## Database Structure

## How to Use
### Products
### Shipments

## Next Steps
