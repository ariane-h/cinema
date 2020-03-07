require_relative('../db/sql_runner.rb')

class Screening

  attr_accessor :film_id, :showtime
  attr_reader :id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @showtime = options['showtime']
  end

  def save
    sql = "INSERT INTO screenings (film_id, showtime)
          VALUES ($1, $2)
          RETURNING id"
    values = [@film_id, @showtime]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def update
    sql = "UPDATE screenings SET (
          film_id, showtime) = ($1, $2)
          WHERE id = $3"
    values = [@film_id, @showtime, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM screenings
            WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM screenings"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

end
