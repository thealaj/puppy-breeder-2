require_relative 'lib/puppy_breeder.rb'

class TerminalClient
  def self.help_menu
    puts "Help Menu"
    puts "add - name, breed, age"
    puts "view: this shows all puppies"
  end

  def self.start
    print "command>  "
    input = gets.chomp
    command = input.split.first

    case command
    when "breed"
      create_new_breed(input)
    when "add"
      add_puppy_to_inventory(input)
    when "show"
      show_pups_by_breed(input)
    when "help"
      help_menu
    when "exit"
      puts "OKTHXBYE"
      return
    else
      puts "i dont know that command"
    end

    start
  end

  def self.create_new_breed(input)
    breed = input.split[1]
    TheMill::PuppyContainer.add_breed(breed)
  end

  def self.get_breed_price(input)
    price = TheMill::PuppyContainer.get_breed_price(input.split[1])
    puts "The breed #{input.split[1]} costs #{price}!!!"
  end

  def self.add_puppy_to_inventory(input)
    input = input.split
    name = input[1]
    breed = input[3]
    age = input[2].to_i

    x = TheMill::Puppy.new(name, age, breed)
    TheMill::PuppyContainer.add_puppy(x)
  end

  def self.show_pups_by_breed(input)
    breed = input.split[1]
    puppies = TheMill::PuppyContainer.puppy_info
    puppies[breed][:list].each do |pup|
      puts "#{pup.name} is #{pup.age} days old!"
    end
  end
end
