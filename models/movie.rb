require_relative("../db/sql_runner")#
require_relative("star")

class Movie

    attr_reader :id
    attr_accessor :title, :genre

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @genre = options['genre']
    end

    def save
        sql = "INSERT INTO movies
        (title, genre) VALUES
        ($1, $2) RETURNING id"
        values = [@title, @genre]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

    def self.delete_all
        sql = "DELETE FROM movies"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM movies
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.map_all(data)
        return data.map { |movie| Movie.new(movie) }
    end

    def self.find_all
        sql = "SELECT * FROM movies"
        result = SqlRunner.run(sql)
        return self.map_all(result)
    end

    def update
        sql = "UPDATE movies
        SET (title, genre)
        = ($1, $2)
        WHERE id = $3"
        values = [@title, @genre, @id]
        SqlRunner.run(sql, values)
    end

    def stars
        sql = "SELECT stars.* FROM stars
        INNER JOIN castings ON
        stars.id = castings.star_id
        WHERE movie_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        return Star.map_all(result)
    end

end
