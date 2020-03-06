require_relative('./models/customer.rb')
require_relative('./models/ticket.rb')
require_relative('./models/film.rb')

require('pry-byebug')

customer1 = Customer.new({'name' => 'Daisy Steiner', 'funds' => 20 })
customer1.save

customer1.name = 'Twist'
customer1.update

film1 = Film.new({'title' => 'Parasite', 'price' => 10})
film1.save

film1.title = 'Okja'
film1.update

film2 = Film.new({'title' => 'The Handmaiden', 'price' => 12})
film2.save


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save

ticket1.film_id = film2.id
ticket1.update
