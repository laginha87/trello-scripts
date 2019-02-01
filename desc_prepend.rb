## Prepends text to tickets of a certain label


load "./header.rb"

label = ARGV[0]

text = ARGV[1]

USAGE = """Prepends text to the title of tickets of a certain label
USAGE: desc_prepend label text
"""

if label.nil? || text.nil?
    print(USAGE)
    exit
end



search = get "search?card_fields=name,id&cards_limit=1000&query=label:#{label}&modelTypes=cards"

search["cards"].each do |c|
    name = c["name"].gsub("#{text} ", "")
    name = "#{text} #{name}"
    put "cards/#{c["id"]}?name=#{name}"


end
