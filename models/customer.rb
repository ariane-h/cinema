require_relative('../db/sql_runner.rb')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save
    sql = "INSERT INTO customers (name, funds)
           VALUES ($1, $2)
           RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update
    sql = "UPDATE customers SET (name,funds) = ($1, $2)
          WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM customers
            WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films
    sql = "SELECT films.* FROM films
           INNER JOIN tickets
           ON films.id = tickets.film_id
           WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    result = films.map { |film| Film.new(film) }
    return result
  end

  def buy_ticket(film)
    @funds -= film.price
    new_ticket = Ticket.new({'customer_id' => self.id, 'film_id' => film.id})
    new_ticket.save
  end

  def ticket_count
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets ON customers.id = tickets.customer_id
          WHERE customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.count
  end

  def self.all
    sql = "SELECT * FROM customers"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
