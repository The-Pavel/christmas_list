def add_gift(choice, gift_list)
  # choice = "Apple"
  # gift_list = array of hashes
  # { "name item" => "Apple" , status => "X"}]
  gift_list << {
  :name => choice,
  :status => " "
  }
end

def list(gift_list)
  if gift_list.empty?
    puts "Your gift list is empty!"
  else
    gift_list.each_with_index { |item, index| puts " #{index + 1}- [#{item[:status]}] - #{item[:name]}"}
  end
end

def delete_gift(choice, gift_list)
  if choice == 0
    puts "invalid choice"
  else
  puts "this does not exist !" if gift_list.delete_at(choice - 1).nil?
  end
end

def mark_item(choice, gift_list)
  #choice = integer
  #gift_list = array
  #find the access  in the gift_list
  if choice == 0
    puts "invalid choice"
  else
  # fixed now - accidentally coppied it with a double ==
  gift_list[choice -1 ][:status] == "X" ? gift_list[choice -1 ][:status] = " " : gift_list[choice -1 ][:status] = "X"
  end
end





