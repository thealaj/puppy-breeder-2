require_relative "spec_helper.rb"

describe TheMill::Repos::RequestLog do
    before(:each) { TheMill.request_repo.destroy }
    before(:each) { TheMill.puppy_repo.destroy }
    before(:each) { TheMill.breed_repo.destroy }

  it "allows Breeder to add customer requests to the database" do

    breed_log = TheMill.breed_repo
    daschund = TheMill::Breed.new(:Daschund, 80)
    breed_log.add_breed(daschund)
    pup_log = TheMill.puppy_repo
    pup = TheMill::Puppy.new("Joan", 7, :Daschund)
    pup_log.add_puppy(pup)

    request = TheMill::Request.new(:Daschund)
    request_log = TheMill.request_repo
    request_log.add_request(request)

    result = request_log.log

    expect(result.first.status).to eq :pending
  end  

it "shows a list of pending requests" do

    breed_log = TheMill.breed_repo
    daschund = TheMill::Breed.new(:Daschund, 80)
    breed_log.add_breed(daschund)
    pup_log = TheMill.puppy_repo
    pup = TheMill::Puppy.new("Joan", 7, :Daschund)
    pup_log.add_puppy(pup)

    request1 = TheMill::Request.new(:Daschund)
    request2 = TheMill::Request.new(:Daschund)
    request_log = TheMill.request_repo
    request_log.add_request(request1)
    request_log.add_request(request2)

    result = request_log.show_pending_requests

    expect(result.first.status).to eq :pending
  end  


  it "sets customer request to on hold if there isn't a breed available when the request is added to the DB" do
     
    breed_log = TheMill.breed_repo
    daschund = TheMill::Breed.new(:Daschund, 80)
    breed_log.add_breed(daschund)
    pup_log = TheMill.puppy_repo
    pup = TheMill::Puppy.new("Joan", 7, :Daschund)
    pup_log.add_puppy(pup)

    request1 = TheMill::Request.new(:Daschund)
    request2 = TheMill::Request.new(:Terrier)
    request_log = TheMill.request_repo
    request_log.add_request(request1)
    request_log.add_request(request2)

    result = request_log.log

    expect(result.first.status).to eq :pending
    expect(result.last.status).to eq :on_hold
 
  end

  it "accepts pending requests" do
     
    breed_log = TheMill.breed_repo
    daschund = TheMill::Breed.new(:Daschund, 80)
    breed_log.add_breed(daschund)
    pup_log = TheMill.puppy_repo
    pup = TheMill::Puppy.new("Joan", 7, :Daschund)
    pup_log.add_puppy(pup)

    request_log = TheMill.request_repo
    request1 = TheMill::Request.new(:Daschund)
    request_log.add_request(request1)

    request_log.update_request("accepted", request1.id)

    result = request_log.log

    expect(result.first.status).to eq :accepted
 
  end

end