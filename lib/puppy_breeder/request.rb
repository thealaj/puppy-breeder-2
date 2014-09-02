module TheMill
  class Request
    attr_reader :breed

    def initialize breed, status=:pending
      @breed = breed
      @status = status
    end

    def pending?
      @status == :pending
    end

    def accepted?
      @status == :accepted
    end

    def accept!
      @status = :accepted
    end
  end
end
