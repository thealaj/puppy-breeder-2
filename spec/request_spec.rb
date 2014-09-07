require_relative "spec_helper.rb"


describe TheMill::Request do
  before(:each) { TheMill.breed_repo.destroy }
  before(:each) { TheMill.puppy_repo.destroy }
  before(:each) { TheMill.request_repo.destroy }


  it "allows customers to submit requests" do 
    breed_log = TheMill.breed_repo
    dawg = TheMill::Breed.new(:Hound, 500)
    breed_log.add_breed(dawg)
    pup_log = TheMill.puppy_repo
    pup = TheMill::Puppy.new("Gideon", 40, :Hound)
    pup_log.add_puppy(pup)

    request = TheMill::Request.new(:Hound)
    request_log = TheMill.request_repo
    request_log.add_request(request)
    

    result = request_log.log

    expect(result.first.status).to eq :pending
  end 

  it "allows Breeder to put requests on hold" do 
    breed_log = TheMill.breed_repo
    dawg = TheMill::Breed.new(:Hound, 500)
    breed_log.add_breed(dawg)
    pup_log = TheMill.puppy_repo
    pup = TheMill::Puppy.new("Gideon", 40, :Hound)
    pup_log.add_puppy(pup)

    request = TheMill::Request.new(:Hound)
    request_log = TheMill.request_repo
    request.hold!
    request_log.add_request(request)
    

    result = request_log.log

    expect(result.first.status).to eq :on_hold
  end

#########
#QUESTION: SHOULD THE ACCEPT METHOD ALSO UPDATE THE DATABASE? OR WOULD THIS FUNCTION ONLY BE USED BEFORE THE REQUEST REPO "ADD REQUEST" METHOD?
######### 

  it "allows Breeder to accept requests" do
    breed_log = TheMill.breed_repo
    daschund = TheMill::Breed.new(:Daschund, 80)
    breed_log.add_breed(daschund)
    pup_log = TheMill.puppy_repo
    pup = TheMill::Puppy.new("Joan", 7, :Daschund)
    pup_log.add_puppy(pup)

    request = TheMill::Request.new(:Daschund)
    request_log = TheMill.request_repo
    request.accept!
    request_log.add_request(request)
    

    result = request_log.log

    expect(result.first.status).to eq :accepted
    end



end