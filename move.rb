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
origin_id = lists.find{|e| e["name"] == origin}["id"]

labelQuery = labels.map{|e| "label:#{e}"}.join("&")
query = labelQuery + ["list:#{origin}", "modelTypes=cards"].join("&")

search = get "search?card_fields=name,id,labels,idList&cards_limit=1000&query=#{query}"

search["cards"].select{|e| e["idList"] == origin_id && ((labels - e["labels"].map{|e| e["name"]}).length  == 0)}.each do |c|
    put "cards/#{c["id"]}?idList=#{dest_id}"
end