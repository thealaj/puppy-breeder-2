module TheMill
  class RequestContainer
    @@requests = []
    @@accepted_requests = []
    
    def self.add_request(req)
      @@requests << req
    end

    def self.show_completed_requests
      @@requests.select { |r| r.accepted? }
    end

    def self.show_pending_requests
      @@requests.select { |r| r.pending? }
    end
  end
end


