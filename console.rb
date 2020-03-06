require_relative('./models/customer.rb')
require_relative('./models/ticket.rb')
require_relative('./models/film.rb')

require('pry-byebug')

customer1 = Customer.new({'name' => 'Daisy Steiner', 'funds' => 20 })
customer1.save


film1 = Film.new({'title' => 'Parasite', 'price' => 10})
film1.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save
