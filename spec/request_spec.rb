require_relative "spec_helper.rb"



describe TheMill::Request do
  before(:each) { TheMill::RequestContainer.class_variable_set :@@requests, [] }

  it "allows customers to submit requests" do 
       request1 = TheMill::Request.new(:mut)

       expect(request1.status).to eq(:pending)
  end 

  it "allows Breeder to put requests on hold" do 
    request1 = TheMill::Request.new(:mut)
    request1.hold!

    expect(request1.status).to eq(:on_hold)
  end

  it "allows requests to be accepted only if a puppy is available" do
      TheMill::PuppyContainer.add_breed(:mut, 20)
      pup1 = TheMill::Puppy.new("Kip", 1, :mut)
      TheMill::PuppyContainer.add_puppy(pup1)
      request1 = TheMill::Request.new(:mut)
      TheMill::RequestContainer.add_request(request1)
      request1.accept!

      expect(request1.status).to eq(:accepted)
    end



  it "prevents requests from being accepted if there are on hold requests" do 
    request1 = TheMill::Request.new(:mut)
    request2 = TheMill::Request.new(:mut)
    TheMill::PuppyContainer.add_breed(:mut, 20)
    pup1 = TheMill::Puppy.new("Kip", 1, :mut)
    TheMill::RequestContainer.add_request(request1)
    TheMill::RequestContainer.add_request(request2)
    request1.hold!
    request2.pending!
    request2.accept!

    expect(request1.status).to eq (:on_hold)
    expect(request2.status).to eq(:pending)
  end

    it "allows on hold requests to be accepted first" do 
    request1 = TheMill::Request.new(:mut)
    TheMill::RequestContainer.add_request(request1)
    TheMill::PuppyContainer.add_breed(:mut, 20)
    pup1 = TheMill::Puppy.new("Kip", 1, :mut)
    TheMill::PuppyContainer.add_puppy(pup1)

    request2 = TheMill::Request.new(:mut)
    TheMill::RequestContainer.add_request(request2)
   
    request2.accept!
    request1.accept!

    expect(request1.status).to eq(:accepted)
    expect(request2.status).to eq(:pending)
  end
end