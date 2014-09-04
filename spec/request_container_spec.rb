require_relative "spec_helper.rb"

describe TheMill::RequestContainer do
  it "allows Breeder to compile customer requests and review pending" do
    request1 = TheMill::Request.new(:Goldendoodle)
    TheMill::RequestContainer.add_request(request1)
    request1.pending!
    result = TheMill::RequestContainer.show_pending_requests

    expect(result).to eq [request1]
  end  
  it "sets customer request to on hold if, when adding request, there isn't a breed available" do
    TheMill::PuppyContainer.add_breed(:mut, 20)
    pup1 = TheMill::Puppy.new("Kip", 1, :mut)
    TheMill::PuppyContainer.add_puppy(pup1)  
    request1 = TheMill::Request.new(:mut)
    request2 = TheMill::Request.new(:Terrier)
    TheMill::RequestContainer.add_request(request1)
    TheMill::RequestContainer.add_request(request2)

      expect(request1.status).to eq :pending
      expect(request2.status).to eq :on_hold

  end

end