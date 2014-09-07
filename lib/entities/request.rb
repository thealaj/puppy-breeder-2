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

#########
#QUESTION: SHOULD THE ACCEPT METHOD ALSO UPDATE THE DATABASE? OR WOULD THIS FUNCTION ONLY BE USED BEFORE THE REQUEST REPO "ADD REQUEST" METHOD?
######### 
    def accept!
      @status = :accepted
    end

    def on_hold?
      @status == :on_hold
    end

    def hold!
      @status = :on_hold
    end
    
  end
end
