module TheMill
  class Request
    attr_reader :breed, :status

    def initialize breed, status=:pending
      @breed = breed
      @status = status
    end

    def pending?
      @status == :pending
    end

    def pending!
      @status = :pending
    end

    def accepted?
      @status == :accepted
    end

    def accept!
      if @status == :pending && TheMill::RequestContainer.holding_queue.empty?
        @status = :accepted
      elsif @status == :on_hold
        @status = :accepted
      else 
      puts "Please review the requests in the holding queue"
      TheMill::RequestContainer.holding_queue
    end
    end

    def on_hold?
      @status == :on_hold
    end

    def hold!
      @status = :on_hold
    end
  end
end
