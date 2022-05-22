# Shopify Developer Intern Challenge (Backend) - Fall 2022

## Table of Contents
- [Problem Requirements](#problem-requirements)
- [Set Up](#set-up)
   - [Using Local Machine](#using-local-machine)
   - [Using Web Browser](#using-web-browser) * RECOMMENDED *
- [Database Structure](#database-structure)
- [How to Use](#how-to-use)

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

### Using Web Browser
The easiest way to view and test out the app is online at: https://lit-sea-01785.herokuapp.com/

While the original problem set had asked for the application to be linked and uploaded to Replit, I had run into issues the getting Ruby on Rails and all of the required gems working with Replit, so I have opted to host to application on Heroku using the link above.

## Database Structure
The current iteration of the database consists of three separate but related tables, as follows...

![data base schema](/public/inventory-web-app-db.png)

Product:
- The Product (or inventory) consists of several variables related to the item itself (e.g., SKU, name, price, quantity)
- A Product has_many (0,..,n) ShipmentItems
- A Product has_many (0,..,n) Shipments through ShipmentItems

Shipment:
- The Shipment contains information about the customer, in this case simply the customer's name
- A Shipment has_many (0,..,n) ShipmentItems
- A Shipment has_many (0,..,n) Products through ShipmentItems

ShipmentItems:
- ShipmentItems is a join table which helps to connect a Shipment with multiple Products, and Products to multiple Shipments
- ShipmentItems belong_to (via a foreign key) a Product and a Shipment
- In addition to references to the Product and Shipment id, ShipmentItems contain information for the quantity of Product included in the Shipment
 
## How to Use
When you first open up the application you will be greeted with a list of available Products:

![homepage](/public/homepage.png)

From there you are able to view more information on individual products by clicking on the SKU, as well as Edit or Delete products using either of the Edit/Delete links. Using the 'Add Product' button on the top right of the screen you are able to add new products.

To create a shipment, simply click on the 'New Shipment' button on the top right of the screen. Clicking the button will redirect you to the New Shipment page:

![new shipment page](/public/new_shipment_page.png)

On the New Shipment page you are given a dropdown menu to specify the number of unique items within the order. Clicking on the 'Generate Shipment Form' button will create additional form inputs for other items, if necessary.

Using these fields, you can then select the products you'd like to order from the dropdown menus (populated with your collection of products) and specify the quantity of each. When you are set, click on 'Create Shipment'. Creating a new shipment will adjust the product quantity downward by the amount of products set to be shipped.

To view all of your shipments and additional details, click on the 'View Shipments' link at the top left of the screen. From there you can view additional information on the shipment by clicking the shipment id, as well as delete shipments using the delete link. When deleting a shipment, the product quantity will be adjusted upward by amount of product within the shipment:

![shipments_page](/public/shipments-page.png)
