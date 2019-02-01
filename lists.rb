load "./header.rb"

board_id = ARGV[0]

USAGE = "USAGE: lists board_id"

if board_id.nil?
    print(USAGE)
    exit
end


lists = get "boards/#{board_id}/lists?cards=none&card_fields=all&filter=open&fields=all"

puts lists.map{|e| [e["name"], e["id"]]}