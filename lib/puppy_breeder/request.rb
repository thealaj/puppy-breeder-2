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
      if self.pending? && TheMill::RequestContainer.holding_queue.empty? && TheMill::PuppyContainer.puppy_info[@breed][:list].length > 0
        @status = :accepted
      elsif self.on_hold? && TheMill::PuppyContainer.puppy_info[@breed][:list].length > 0
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
