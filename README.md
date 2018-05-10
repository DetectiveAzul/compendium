# Compendium

Compendium is a Spellbook tracker made to create, track and organize Dungeons and Dragons spells on units call Spellbooks, owned by Characters. Compendium is a Sinatra RESTfull WebApp written following the MVC development model. Model was written using Ruby, View is based on HTML, CSS and Embedded Ruby. Controller was handled by Sinatra Framework. Finally, database and CRUD actions were handled by PSQL. It was made during week 5 of the Codeclan software development course. A live version of the app can be found at: http://dndcompendium.herokuapp.com/. 

## Install
* Install Postgres: `$ brew install postgres && brew services start postgresql`
* Install rvm http://rvm.io/
* Install bundler: `$ gem install bundler`
* Install pry: `$ gem install pry`
* `$ git clone ...`

* If prompted, install the version of Ruby required for this project
* Install project gems: `$ bundler install`
* Create development database: `$ createdb dnd_compendium`
* Set up tables: `$ psql -d dnd_compendium -f db/dnd_compendium.sql`
* Seed development database with some data `$ ruby db/seed.rb`

## Run
* `ruby app.rb`

![character view](https://github.com/DetectiveAzul/compendium/blob/master/screenshot.png?raw=true)

