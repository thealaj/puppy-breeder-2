require_relative "spec_helper.rb"

describe TheMill::Repos::RequestLog do
    before(:each) { TheMill::Repos::RequestLog.new.destroy }
    before(:each) { TheMill::Repos::PuppyLog.new.destroy }
    before(:each) { TheMill::Repos::BreedLog.new.destroy }

  it "allows Breeder to add customer requests to the database" do
    request = TheMill::Request.new(:Goldendoodle)
    # request_log = TheMill::Repos::RequestLog.new
    # breed_log = TheMill::Repos::BreedLog.new
    # pup_log = TheMill::Repos::PuppyLog.new
    request_log.add_request(request)
    result = request_log.log

    expect(result.first.status).to eq "pending"
  end  

  xit "sets customer request to on hold if, when adding request, there isn't a breed available" do
     
    request2 = TheMill::Request.new(:Terrier)
    TheMill::Repos::RequestLog.add_request(request1)
    TheMill::RequestContainer.add_request(request2)

      expect(TK).to eq tk
 
  end

end