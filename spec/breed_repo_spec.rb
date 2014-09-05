require_relative "spec_helper.rb"


describe TheMill::Repos::BreedLog do
  before(:each) { TheMill::Repos::BreedLog.new.destroy }
  before(:each) { TheMill::Repos::PuppyLog.new.destroy }
  before(:each) { TheMill::Repos::RequestLog.new.destroy }

  it "allows breeder to add breeds to the database" do 
    
    daschund = TheMill::Breed.new(:Daschund, 80)
    breedlog = TheMill::Repos::BreedLog.new
    breedlog.add_breed(daschund)
    
    result = breedlog.breed_log

  expect(result.price).to eq("$80.00")
  end 

  it "allows Breeder to view the price of a breed" do 
    
    mut = TheMill::Breed.new(:Mut, 100_000)
    breedlog = TheMill::Repos::BreedLog.new
    breedlog.add_breed(mut)
    daschund = TheMill::Breed.new(:Daschund, 80)
    breedlog = TheMill::Repos::BreedLog.new
    breedlog.add_breed(daschund)
    result = breedlog.get_breed_price(mut)

    expect(result).to eq("$100,000.00")
  end
end