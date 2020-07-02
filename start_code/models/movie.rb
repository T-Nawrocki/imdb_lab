class Movie

    attr_reader :id
    attr_accessor :title, :genre

    def initialize(options)
        @id = options['id'] if options['id']
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

end
