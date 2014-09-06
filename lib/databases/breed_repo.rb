require 'pg'

module TheMill
  module Repos
  class BreedLog

  def initialize
    @db = PG.connect(host: 'localhost', dbname: 'puppy-breederdb')
    build_breed_tables
  end

  def destroy
      @db.exec (%q[
        DROP TABLE IF EXISTS breedprices;
        ])
    end

  def build_breed_tables
    @db.exec(%q[
    CREATE TABLE IF NOT EXISTS breedprices(
      id serial,
      breed text,
      price money 
      )
    ])
  end

  def build_breed(entries) #breed helper
    entries.map do |breed|
      x = TheMill::Breed.new(breed["breed"], breed["price"])
      x.instance_variable_set :@id, breed["id"].to_i
      x
    end
  end

  def add_breed(breed)
    build_breed_tables
      @db.exec(%q[
        INSERT INTO breedprices (breed, price)
        VALUES ($1, $2);
        ], [breed.breed, breed.price])
    end

  def breed_log
      result = @db.exec('SELECT * FROM breedprices')
      build_breed(result.entries)
  end

  def get_breed_price(breed)
    result = @db.exec(%q[
      SELECT price FROM breedprices WHERE breed = $1;], [breed.breed])
    result.entries.first["price"]
  end

     end
  end
end


 