require_relative "spec_helper.rb"

describe TheMill::Puppy do
  it "allows Breeder to list puppies with name, breed and age" do 
    pup1 = TheMill::Puppy.new("Kip", 1, "mut")

    expect(pup1.name).to eq "Kip"
      expect(pup1.age).to eq 1
    expect(pup1.breed).to eq "mut"
  end  

  
end