require_relative('./models/customer.rb')
require_relative('./models/ticket.rb')
require_relative('./models/film.rb')

require('pry-byebug')

Ticket.delete_all
Film.delete_all
Customer.delete_all

customer1 = Customer.new({'name' => 'Daisy Steiner', 'funds' => 20 })
customer1.save

# customer1.name = 'Twist'
# customer1.update

customer2 = Customer.new({'name' => 'Tim Bisley', 'funds' => 50})
customer2.save

# customer2.delete
customer3 = Customer.new({'name' => 'Mike Watt', 'funds' => 10})
customer3.save

film1 = Film.new({'title' => 'Parasite', 'price' => 10})
film1.save

# film1.title = 'Okja'
# film1.update

film2 = Film.new({'title' => 'The Handmaiden', 'price' => 12})
film2.save

film3 = Film.new({'title' => 'Chaser', 'price' => 6})
film3.save
# film3.delete


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id })
ticket2.save
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id })
ticket3.save

# ticket1.film_id = film2.id
# ticket1.update
# ticket1.delete

binding.pry
nil
