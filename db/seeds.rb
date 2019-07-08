# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.destroy_all
heinlein = Author.create(first_name:"Robert", last_name:"Heinlein")
gaiman = Author.create(first_name: "Neil", last_name: "Gaiman")
kastrup = Author.create(first_name: "Bernardo", last_name: "Kastrup")
nin = Author.create(first_name: "Anais", last_name: "Nin")
heinlein.books.create(title: "Stranger in a Strange Land")
heinlein.books.create(title: "Friday")
heinlein.books.create(title: "The Moon is a Harsh Mistress")
gaiman.books.create(title: "American Gods")
gaiman.books.create(title: "Neverworld")
gaiman.books.create(title: "Anansi Boys")
kastrup.books.create(title: "Brief Peek Beyond")
nin.books.create(title: "Little Birds")
nin.books.create(title: "Delta of Venus")