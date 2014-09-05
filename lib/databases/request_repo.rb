require 'pg'


module TheMill
  module Repos
  class RequestLog
    
    def initialize
      @db = PG.connect(host: 'localhost', dbname: 'puppy-breederdb')
      build_req_tables
    end

    def destroy
      @db.exec (%q[
        DROP TABLE IF EXISTS requests;
        ])
    end
    
    def build_request(entries) #helper
      entries.map do |req|
        x = TheMill::Request.new(req["breed"])
        x.instance_variable_set :@id, req["id"].to_i
        x.instance_variable_set :@status, req["status"].to_sym
        x 
      end
    end

    def build_req_tables
    @db.exec(%q[
      CREATE TABLE IF NOT EXISTS requests(
      id serial,
      breed text,
      status text)
    ])
    end

    def log
      result = @db.exec('SELECT * FROM requests;')
      build_request(result.entries)
    end

    
    def add_request(request)
     pups_available = TheMill::Repos::PuppyLog.pup_log.select {|p| p.breed == request.breed}

       if pups_available.empty?
        request.hold!
      end

      @db.exec(%q[
        INSERT INTO requests (breed, status)
        VALUES ($1, $2);
        ], [request.breed, request.status])
    end

    def show_completed_requests
     result = @db.exec(%q[
        SELECT * FROM requests WHERE status = 'accepted';])
     build_request(result.entries)
    end

    def show_pending_requests
      result = @db.exec(%q[
        SELECT * FROM requests WHERE status = 'pending'])
      build_request(result.entries)
    end

    def self.holding_queue
      result = @db.exec(%q[
        SELECT * FROM requests WHERE status = 'on_hold'])
      build_request(result.entries)
    end
    end
  end
end

  # def build_breed_tables
  #   @db.exec(%q[
  #   CREATE TABLE IF NOT EXISTS breedprices(
  #     id serial,
  #     breed text,
  #     price money 
  #     ##RETURNING price; [breed, price]
  #     )
  #     ##result.entries.first["price"].to_i
  #   ])
  # end