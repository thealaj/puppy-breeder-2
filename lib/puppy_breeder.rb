module TheMill
  #req repo setter
  def self.request_repo=(x)
    @request_repo = x
  end

  def self.request_repo
    @request_repo
  end

  def self.puppy_repo=(x)
    @puppy_repo = x
  end

  def self.puppy_repo
    @puppy_repo
  end
 
  def self.breed_repo=(x)
    @breed_repo = x
  end

  def self.breed_repo
    @breed_repo
  end
end

require_relative 'entities/puppy.rb'
require_relative 'entities/request.rb'
require_relative 'databases/puppy_repo.rb'
require_relative 'databases/request_repo.rb'
require_relative 'databases/breed_repo.rb'
require_relative  'entities/breed.rb'

TheMill.request_repo = TheMill::Repos::RequestLog.new
TheMill.puppy_repo = TheMill::Repos::PuppyLog.new
TheMill.breed_repo = TheMill::Repos::BreedLog.new


# now
#TheMill::.request_repo.add_request 