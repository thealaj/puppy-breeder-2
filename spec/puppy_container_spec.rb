require_relative "spec_helper.rb"

describe TheMill::PuppyContainer do
  it "allows Breeder to add breeds by price and view breed price" do 
    TheMill::PuppyContainer.add_breed(:Daschund, 20)
    result = TheMill::PuppyContainer.get_breed_price(:Daschund)

    expect(result).to eq(20)
  end  
end