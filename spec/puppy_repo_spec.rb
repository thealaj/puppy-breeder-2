require_relative "spec_helper.rb"

describe TheMill::Repos::PuppyLog do
  before(:each) { TheMill.puppy_repo.destroy }
  before(:each) { TheMill.breed_repo.destroy }
  before(:each) { TheMill.request_repo.destroy }

  it "allows breeder to add puppy to inventory" do 
    
    daschund = TheMill::Breed.new(:Daschund, 80)
    breedlog = TheMill.breed_repo
    breedlog.add_breed(daschund)
    pup1 = TheMill::Puppy.new("Jeff", 2, :Daschund)
    pup2 = TheMill::Puppy.new("Joan", 7, :Daschund)

    pup_repo = TheMill.puppy_repo
    pup_repo.add_puppy(pup1)
    pup_repo.add_puppy(pup2)

    result = pup_repo.pup_log

  expect(result.first.name).to eq("Jeff")
  expect(result[1].id).to eq(2)
  end 

  end 


