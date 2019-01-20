load "./header.rb"

USAGE = "USAGE: move board_id originListName destListName labelName"

board_id = ARGV[0]
origin = ARGV[1]
dest = ARGV[2]
labels = ARGV[3..-1]

if board_id.nil? || origin.nil? || labels.nil? || dest.nil?
    print(USAGE)
    exit
end

lists = get "boards/#{board_id}/lists?cards=none&card_fields=all&filter=open&fields=all"

dest_id =  lists.find{|e| e["name"] == dest}["id"]

labelQuery = labels.map{|e| "label:#{e}"}.join("&")

search = get "search?card_fields=name,id&cards_limit=1000&query=#{labelQuery}&list:#{origin}&modelTypes=cards"


search["cards"].each do |c|
    put "cards/#{c["id"]}?idList=#{dest_id}"
end