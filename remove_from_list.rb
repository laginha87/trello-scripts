load "./header.rb"

list_id = ARGV[0]
label_id = ARGV[1]

cards = get "lists/#{list_id}/cards?fields=id"

cards.each do |id|
    p simple_delete "cards/#{id["id"]}/idLabels/#{label_id}?"
end
