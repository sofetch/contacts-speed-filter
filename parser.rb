# Google Contacts categorizer, fast
#
# The idea behind this script, is to be able to go through a .csv dump of your Google contacts and decide if you want to keep that contact or not, for now.
#
# TODO: Add functionality to assign certain keyboard keys in your "home-row" to quickly attach a category to a contact and move on.
#
# To run
# $ ruby parser.rb

require 'csv'
CSV.open("clean_contacts.csv", "wb") do |new_csv|
  CSV.foreach("google.csv", headers: true) do |row|
    puts "#{row['Name']}, #{row['E-mail 1 - Value']}"
    answer = gets.chomp
    if answer == 'k'
      new_csv << row
      puts 'Noted!, next!'
    else
      puts 'passing!'
    end
  end
end
