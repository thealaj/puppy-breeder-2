require_relative "spec_helper.rb"

describe TheMill::Puppy do
  it "allows Breeder to list puppies with name, breed and age" do 
    pup1 = TheMill::Puppy.new("Kip", 1, :Mut)

    expect(pup1.name).to eq "Kip"
    expect(pup1.age).to eq 1
    expect(pup1.breed).to eq :Mut
  end  
end

describe TheMill::Breed do
  it "allows Breeder to add breeds with name and price" do 
    mut = TheMill::Breed.new(:Mut, 10000)
  end 
end