require 'sinatra'
require_relative 'lib/puppy_breeder.rb'

get '/' do
  erb :index
end

get '/puppies' do
  puppies = TheMill::PuppyContainer.puppy_info
  @dog_list = puppies.map { |k, v| v[:list] }.flatten
  erb :puppies
end

get '/puppy' do
  erb :puppy
end

post '/puppy' do
  x = TheMill::Puppy.new(params["name"], params["age"], params["breed"])
  if TheMill::PuppyContainer.puppy_info[x.breed].nil?
    TheMill::PuppyContainer.add_breed(x.breed)
  end
  TheMill::PuppyContainer.add_puppy(x)
  redirect to '/puppies'
end
