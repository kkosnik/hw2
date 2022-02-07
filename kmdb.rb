# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!

# rails generate model Movie
# rails generate model Person
# rails generate model Role

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

puts "There are now #{Person.all.count} people."

person = Person.new
person.name = "Christopher Nolan"
person.save

puts "There are now #{Person.all.count} people." # 1

chris = Person.where({name: "Christopher Nolan"})[0]
chris_id = person.id

movie = Movie.new
movie.title = "Batman Begins"
movie.year_released = "2005"
movie.rated = "PG-13"
movie.person_id = chris_id
movie.save

movie = Movie.new
movie.title = "The Dark Knight"
movie.year_released = "2008"
movie.rated = "PG-13"
movie.person_id = chris_id
movie.save

movie = Movie.new
movie.title = "The Dark Knight Rises"
movie.year_released = "2012"
movie.rated = "PG-13"
movie.person_id = chris_id
movie.save

puts "There are now #{Movie.all.count} movies." # 3

# Batman Begins
## People
person = Person.new
person.name = "Christian Bale"
person.save

person = Person.new
person.name = "Michael Caine"
person.save

person = Person.new
person.name = "Liam Neeson"
person.save

person = Person.new
person.name = "Katie Holmes"
person.save

person = Person.new
person.name = "Gary Oldman"
person.save

puts "There are now #{Person.all.count} people." # 6

#find movie id
batman_begins = Movie.where({title: "Batman Begins"})[0]
bb_id = batman_begins.id

#find people ids
cb = Person.where({name: "Christian Bale"})[0]
cb_id = cb.id
mc = Person.where({name: "Michael Caine"})[0]
mc_id = mc.id
ln = Person.where({name: "Liam Neeson"})[0]
ln_id = ln.id
kh = Person.where({name: "Katie Holmes"})[0]
kh_id = kh.id
go = Person.where({name: "Gary Oldman"})[0]
go_id = go.id

## Roles
role = Role.new
role.character_name = "Bruce Wayne"
role.movie_id = bb_id
role.person_id = cb_id
role.save

role = Role.new
role.character_name = "Alfred"
role.movie_id = bb_id
role.person_id = mc_id
role.save

role = Role.new
role.character_name = "Ra's Al Ghul"
role.movie_id = bb_id
role.person_id = ln_id
role.save

role = Role.new
role.character_name = "Rachel Dawes"
role.movie_id = bb_id
role.person_id = kh_id
role.save

role = Role.new
role.character_name = "Commissioner Gordon"
role.movie_id = bb_id
role.person_id = go_id
role.save

puts "There are now #{Role.all.count} roles." # 5

# Dark Night
## People
person = Person.new
person.name = "Heath Ledger"
person.save

person = Person.new
person.name = "Aaron Eckhart"
person.save

person = Person.new
person.name = "Maggie Gyllenhaal"
person.save

puts "There are now #{Person.all.count} people." # 9

#find movie id
dark_knight = Movie.where({title: "The Dark Knight"})[0]
dk_id = dark_knight.id

#find people ids
hl = Person.where({name: "Heath Ledger"})[0]
hl_id = hl.id
ae = Person.where({name: "Aaron Eckhart"})[0]
ae_id = ae.id
mg = Person.where({name: "Maggie Gyllenhaal"})[0]
mg_id = mg.id

## Roles
role = Role.new
role.character_name = "Bruce Wayne"
role.movie_id = dk_id
role.person_id = cb_id
role.save

role = Role.new
role.character_name = "Joker"
role.movie_id = dk_id
role.person_id = hl_id
role.save

role = Role.new
role.character_name = "Harvey Dent"
role.movie_id = dk_id
role.person_id = ae_id
role.save

role = Role.new
role.character_name = "Alfred"
role.movie_id = dk_id
role.person_id = mc_id
role.save

role = Role.new
role.character_name = "Rachel Dawes"
role.movie_id = dk_id
role.person_id = mg_id
role.save

puts "There are now #{Role.all.count} roles." # 10

# Dark Night Rises
## People
person = Person.new
person.name = "Tom Hardy"
person.save

person = Person.new
person.name = "Joseph Gordon-Levitt"
person.save

person = Person.new
person.name = "Anne Hathaway"
person.save

puts "There are now #{Person.all.count} people." # 12

#find movie id
dark_knight_rises = Movie.where({title: "The Dark Knight Rises"})[0]
dkr_id = dark_knight_rises.id

#find people ids
th = Person.where({name: "Tom Hardy"})[0]
th_id = th.id
jgl = Person.where({name: "Joseph Gordon-Levitt"})[0]
jgl_id = jgl.id
ah = Person.where({name: "Anne Hathaway"})[0]
ah_id = ah.id

## Roles
role = Role.new
role.character_name = "Bruce Wayne"
role.movie_id = dkr_id
role.person_id = cb_id
role.save

role = Role.new
role.character_name = "Commissioner Gordon"
role.movie_id = dkr_id
role.person_id = go_id
role.save

role = Role.new
role.character_name = "Bane"
role.movie_id = dkr_id
role.person_id = th_id
role.save

role = Role.new
role.character_name = "John Blake"
role.movie_id = dkr_id
role.person_id = jgl_id
role.save

role = Role.new
role.character_name = "Selina Kyle"
role.movie_id = dkr_id
role.person_id = ah_id
role.save

puts "There are now #{Role.all.count} roles." # 15


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

all_movies = Movie.all
#all_directors = Person.where({title: "The Dark Knight Rises"})[0]

director_id = []

  if director_id[movie[:person_id]] == nil # if director isn't in the array already, add it
        director_id.push("#{movie[:person_id]}")
    end


puts director_id

#for person in all_people
   # if person.id == movie.person_id
   # for movie in all_movies
   # puts "#{movie.title}   #{movie.year_released}     #{movie.rated} #{person[:id][:person_id}]"
#end

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!


all_roles = Role.all

for role in all_roles
    puts "#{role.movie.title}   #{role.person.name}     #{role.character_name}"
end


# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle