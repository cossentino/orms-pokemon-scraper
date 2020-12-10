require_relative '../bin/environment.rb'


class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(name:, type:, db:, id: nil)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?,?)
        SQL

        db.execute(sql, name, type)

        # new_pokemon = Pokemon.new(name, type, @db)
        # new_pokemon.id = @db.execute(SELECT )
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
        SQL

        found_pokemon = db.execute(sql, id)[0]
        new_pokemon_object = Pokemon.new(name: found_pokemon[1], type: found_pokemon[2], db: db, id: found_pokemon[0])
    end



end
