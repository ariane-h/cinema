require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save
    sql = "INSERT INTO films (title, price)
           VALUES ($1, $2)
           RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update
    sql = "UPDATE films set (title, price) = ($1, $2)
          WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets
          ON customers.id = tickets.customer_id
          WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end

  def tickets_sold
    sql = "SELECT films.* FROM films
            INNER JOIN tickets ON films.id = tickets.film_id
            WHERE film_id = $1"
    values = [@id]
    tickets_sold = SqlRunner.run(sql, values)
    return tickets_sold.count
  end

  #extension attempt, want to return showtime

  def screening_with_most_tickets_sold
    sql = "SELECT COUNT(tickets.id), tickets.screening_id
          FROM screenings
          INNER JOIN tickets ON screenings.film_id = tickets.film_id
          WHERE screenings.film_id = $1
          GROUP BY tickets.screening_id
          ORDER BY COUNT(tickets.id) DESC;"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return result
  end

  def self.all
    sql = "SELECT * FROM films"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
