require_relative "spec_helper.rb"

describe TheMill::RequestContainer do
  it "allows Breeder to compile customer requests and reviewing pending" do
    request1 = TheMill::Request.new("goldendoodle")
    TheMill::RequestContainer.add_request(request1)
    request1.pending!
    result = TheMill::RequestContainer.show_pending_requests

    expect(result).to eq [request1]
  end  


end