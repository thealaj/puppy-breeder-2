module TheMill
  class RequestContainer
    @@requests = []
    
    attr_accessor :holding_queue
    def self.add_request(req)
      if !TheMill::PuppyContainer.puppy_info.has_key?(req.breed)
        req.hold!
      end
      @@requests.push(req)
    end

    def self.show_completed_requests
      @@requests.select { |r| r.accepted? }
    end

    def self.show_pending_requests
      @@requests.select { |r| r.pending? }
    end

    def self.holding_queue
      @holding_queue = @@requests.select { |r| r.on_hold? }
    end
  end
end


