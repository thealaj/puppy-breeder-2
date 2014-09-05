require 'pg'

module TheMill
  module Repos
  class PuppyLog

    def initialize
      @db = PG.connect(host: 'localhost', dbname: 'puppy-breederdb')
      build_pup_tables
    end

    def destroy
      @db.exec (%q[
        DROP TABLE IF EXISTS pupinventory;
        ])
    end

    def build_pup_tables
      @db.exec(%q[
      CREATE TABLE IF NOT EXISTS pupinventory(
        id serial,
        breed text,
        name text, 
        age integer     
        );
      ])
    end

    def build_pup(entries) #helper
      entries.map do |pup|
        x = TheMill::Puppy.new(pup["name"], pup["age"], pup["breed"])
        x.instance_variable_set :@id, pup["id"].to_i
        x
      end  
    end
    

    def pup_log
      result = @db.exec('SELECT * FROM pupinventory;')
      build_pup(result.entries)
    end


    def add_puppy(pup)
      # breeds_available = TheMill.breed_repo.breed_log.select {|p| p.breed == pup.breed}
      # if breeds_available.empty?
      #   raise "No breed for pup"
      # else
      build_pup_tables
      @db.exec(%q[
        INSERT INTO pupinventory (breed, name, age) VALUES ($1, $2, $3);], [pup.breed, pup.name, pup.age])
      # end
    end

    end
  end
end
