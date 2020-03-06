
class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save
    sql = "INSERT INTO tickets (customer_id, film_id)
           VALUES ($1, $2)
           RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id'].to_i
  end
end
