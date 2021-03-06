require_relative('./models/customer.rb')
require_relative('./models/ticket.rb')
require_relative('./models/film.rb')
require_relative('./models/screening.rb')


require('pry-byebug')

Ticket.delete_all
Screening.delete_all
Film.delete_all
Customer.delete_all

#customers

customer1 = Customer.new({'name' => 'Daisy Steiner', 'funds' => 20 })
customer1.save

customer2 = Customer.new({'name' => 'Tim Bisley', 'funds' => 50})
customer2.save

customer3 = Customer.new({'name' => 'Mike Watt', 'funds' => 10})
customer3.save

customer4 = Customer.new({'name' => 'Marsha Klein', 'funds' => 80})
customer4.save

customer5 = Customer.new({'name' => 'Brian Topp', 'funds' => 60})
customer5.save

customer6 = Customer.new({'name' => 'Twist Morgan', 'funds' => 40})
customer6.save

#films

film1 = Film.new({'title' => 'Parasite', 'price' => 10})
film1.save

film2 = Film.new({'title' => 'The Handmaiden', 'price' => 12})
film2.save

film3 = Film.new({'title' => 'Chaser', 'price' => 6})
film3.save

#Screenings

screening1 = Screening.new({'film_id' => film1.id, 'showtime' => '21:00'})
screening1.save

screening2 = Screening.new({'film_id' => film1.id, 'showtime' => '23:15'})
screening2.save

screening3 = Screening.new({'film_id' => film2.id, 'showtime' => '16:00'})
screening3.save

#tickets for film one, screening one
customer1.buy_ticket(film1, screening1)
customer1.buy_ticket(film1, screening1)
customer2.buy_ticket(film1, screening1)
customer3.buy_ticket(film1, screening1)

#tickets for film one, late showing
customer2.buy_ticket(film1, screening3)
customer3.buy_ticket(film1, screening3)

#tickets for screening film two, screening two
customer1.buy_ticket(film2, screening2)
customer3.buy_ticket(film2, screening2)
customer2.buy_ticket(film2, screening2)



binding.pry
nil
