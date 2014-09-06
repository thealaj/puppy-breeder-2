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

  xit "sets customer request to on hold if, when adding request, there isn't a breed available" do
     
    request2 = TheMill::Request.new(:Terrier)
    TheMill::Repos::RequestLog.add_request(request1)
    TheMill::RequestContainer.add_request(request2)

      expect(TK).to eq tk
 
  end

end