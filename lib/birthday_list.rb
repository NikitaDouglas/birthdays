class Birthdays

  def initialize
    @birthdays = []
  end

  def add_birthday(name,date)
    store_birthday(name,date)
    "Birthday stored!"
  end

  def store_birthday(name, date)
    @birthdays << {:name => name, :date => date}
  end

  def show_birthday_list
    @birthdays.each do |birthday|
      puts "#{birthday[:name]}: #{birthday[:date]}"
    end
  end

end
