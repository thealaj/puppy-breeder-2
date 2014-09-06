require_relative "spec_helper.rb"


describe TheMill::Request do
  before(:each) { TheMill.breed_repo.destroy }
  before(:each) { TheMill.puppy_repo.destroy }
  before(:each) { TheMill.request_repo.destroy }


  it "allows customers to submit requests" do 
      request = TheMill::Request.new(:Chiweenie)
      request_log = TheMill.request_repo
      ####ALEX: ADD LOG MESS IN HERE

       expect(request.status).to eq(:pending)
  end 

  it "allows Breeder to put requests on hold" do 
    request = TheMill::Request.new(:Chiweenie)
    request.hold!
    ####ALEX: ADD LOG MESS IN HERE

    expect(request.status).to eq(:on_hold)
  end

  xit "allows Breeder to accept requests" do
    daschund = TheMill::Breed.new(:Daschund, 80)
    breedlog = TheMill.breed_repo
    breedlog.add_breed(daschund)
    pup1 = TheMill::Puppy.new("Jeff", 2, :Daschund)
    pup2 = TheMill::Puppy.new("Joan", 7, :Daschund)
####ALEX: ADD LOG MESS IN HERE
    pup_repo = TheMill.puppy_repo
    pup_repo.add_puppy(pup1)
    request = TheMill::Request.new(:Daschund)

    expect(request1.status).to eq(:accepted)
    end



end