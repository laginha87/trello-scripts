load "./header.rb"

board_id = ARGV[0]
list_name = ARGV[1]
label_name = ARGV[2]

USAGE = "USAGE: remove_from_list board_id list_name label_name"


if board_id.nil? || list_name.nil? || label_name.nil?
    print(USAGE)
    exit
end

lists = get_lists(board_id)
labels = get_labels(board_id)

list_id = lists.find{|e| e["name"] == list_name }["id"]
label_id = labels.find{|e| e["name"] == label_name }["id"]

cards = get "lists/#{list_id}/cards?fields=id"

cards.each do |id|
    p simple_delete "cards/#{id["id"]}/idLabels/#{label_id}?"
end
