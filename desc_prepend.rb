## Prepends text to tickets of a certain label


load "./header.rb"

label = ARGV[0]

text = ARGV[1]


print label
search = get "search?card_fields=name,id&cards_limit=1000&query=label:#{label}&modelTypes=cards"
puts search
search["cards"].each do |c|
    name = c["name"].gsub("#{text} ", "")
    name = "#{text} #{name}"
    put "cards/#{c["id"]}?name=#{name}"


end

# Get cards from label

# Get Card
# Update Card