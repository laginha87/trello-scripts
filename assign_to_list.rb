load "./header.rb"

list_id = ARGV[0]
label_id = ARGV[1]

USAGE = "USAGE: assign_to_list list_id label_id"

if list_id.nil? || label_id.nil?
    print(USAGE)
    exit
end


cards = get "lists/#{list_id}/cards?fields=id"

cards.each do |id|
    p simple_post "cards/#{id["id"]}/idLabels?value=#{label_id}"
end
