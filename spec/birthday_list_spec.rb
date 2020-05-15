# Store all of my friends’ birthdays so I can keep track of them
# See them all at once with their names and birthdays each on a line in a tidy format
# Check whose birthday it is today - the program can check through the birthdays I have
# stored and check each one to see if it’s someone’s birthday, and tells me something
# like "It's Mary Poppin's birthday today! They are 124 years old!" - otherwise
# it won't say anything.

#Imagined Interaction
# > add_birthday(somename, somedate)
# => "Birthday stored!"
# > show_birthday_list
# => X, today
#  => Y, next week
# > check_birthdays
# => "It's x's birthday today. They are X years old"

require_relative '../lib/birthday_list'

describe Birthdays do
  subject(:birthday) { Birthdays.new }

  it "allows the user to #add_birthday" do
    expect(birthday).to respond_to(:add_birthday).with(2).arguments
  end

  it "returns 'Birthday stored!'" do
    expect(birthday.add_birthday("Rae","22/12/1993")).to eq "Birthday stored!"
  end

  it "allows the user to #store_birthday in a hash inside an array" do
    expect(birthday).to respond_to(:store_birthday).with(2).arguments
    expect(birthday.store_birthday("Rae", "22/12/1993")).to eq ([{:name => "Rae", :date => "22/12/1993"}])
  end

  it "allows the user to see a list of birthdays with #show_birthday_list" do
    expect(birthday).to respond_to(:show_birthday_list)
    birthday.store_birthday("Rae", "22/12/1993")
    expect { birthday.show_birthday_list }
    .to output("Rae: 22/12/1993\n")
    .to_stdout
    birthday.store_birthday("Nikita", "07/10/1995")
    expect { birthday.show_birthday_list }
    .to output("Rae: 22/12/1993\nNikita: 07/10/1995\n")
    .to_stdout
  end
end

# # describe "#show_birthday_list" do
# #   xit "accepts 2 arguments"
# #     expect(show_birthday_list)
# #   xit "puts 'name: date'" do
# #     expect(show_birthday_list).to eq("Rae: date")
# #   end
# end
