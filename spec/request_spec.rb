require_relative "spec_helper.rb"

describe TheMill::Request do
  it "allows customers to submit requests" do 
       request1 = TheMill::Request.new("goldendoodle")

       expect(request1.status).to eq(:pending)
  end 

  it "allows Breeder to put requests on hold" do 
    request1 = TheMill::Request.new("goldendoodle")
    request1.hold!

    expect(request1.status).to eq(:on_hold)
  end

  it "prevents requests from being accepted if there are on hold requests" do 
    request1 = TheMill::Request.new("goldendoodle")
    request2 = TheMill::Request.new("goldendoodle")
    TheMill::RequestContainer.add_request(request1)
    TheMill::RequestContainer.add_request(request2)
    request2.pending!
    request1.hold!
    request2.accept!

    expect(request2.status).to eq(:pending)
  end

    it "allows on hold requests to be accepted first" do 
    request1 = TheMill::Request.new("goldendoodle")
    request2 = TheMill::Request.new("goldendoodle")
    request2.pending!
    request1.hold!
    request1.accept!

    expect(request1.status).to eq(:accepted)

  end
end