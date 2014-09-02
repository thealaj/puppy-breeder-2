module TheMill
  class PuppyContainer
    @@puppies = {}

    def self.add_breed(breed, price=9999)
      @@puppies[breed] = {:price => price, :list => []}
    end

    def self.add_puppy(pup)
      if @@puppies[pup.breed]
        @@puppies[pup.breed][:list] << pup
      else
        raise "No breed for pup"
      end
    end

    def self.get_breed_price(breed)
      @@puppies[breed][:price]
    end

    def self.puppy_info
      @@puppies
    end
  end
end
