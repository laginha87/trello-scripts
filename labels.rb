load "./header.rb"

board_id = ARGV[0]

USAGE = "USAGE: labels board_id"

if board_id.nil?
    print(USAGE)
    exit
end

labels = get "boards/#{board_id}/labels?cards=none&card_fields=all&filter=open&fields=all"

puts labels.map{|e| [e["name"], e["id"]]}