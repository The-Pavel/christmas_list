require_relative "backend"
require_relative "api_service"
require "csv"

#each row need to convert into a hash
#key in hash name , status
#push those hashes into an array


gift_list = []

filepath = 'gifts.csv'
csv_options = { col_sep: ',', headers: :first_row }

CSV.foreach(filepath, csv_options) do |row|
  gift_list << {
  :name => row["name"],
  :status => row["status"]
  }
end


user_choice = ""
puts "Welcome to the Christmas gift list"

until user_choice == "quit"

  puts "What do you want to do : [List, Add, Delete, Mark, Idea, Quit]"
  user_choice = gets.chomp.downcase

  case user_choice
    when "list"
      list(gift_list)
    when "add"
      puts "What do you want to add"
      choice_gift = gets.chomp.capitalize
      add_gift(choice_gift, gift_list)
    when "delete"
      puts "What do you want to delete - type in gift number"
      list(gift_list)
      gift_to_delete = gets.chomp.to_i
      delete_gift(gift_to_delete, gift_list)
    when "mark"
       list(gift_list)
       puts "Which item have you bought(give the index)"
       bought_item = gets.chomp.to_i
       mark_item(bought_item, gift_list)
       list(gift_list)
     when "idea"
      puts "what are you looking for from Etsy"
      article = gets.chomp
      idea_options = idea_item(article)
      puts "Pick an item to add to your gift list or [Q] to exit:"
      etsy_selection = gets.chomp
      if (etsy_selection.to_i - 1) >= 0 && (etsy_selection.to_i - 1) <= (idea_options.length - 1)
        add_gift(idea_options[etsy_selection.to_i-1], gift_list)
      end
    else
      puts "Wrong choice" unless user_choice == "quit"
  end
end
puts "Goodbye"


csv_options = { col_sep: ',', force_quotes: true }
CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ["name", "status"]
  gift_list.each do |gift|
    csv << [gift[:name], gift[:status]]
  end
end








