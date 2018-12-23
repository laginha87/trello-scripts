require 'json'
load "./env.rb"

AUTH = "&key=#{TRELLO_APP_KEY}&token=#{TRELLO_TOKEN}"

def get(path)
    JSON.parse `curl --request GET \
    --url 'https://api.trello.com/1/#{path}#{AUTH}'`
end


def simple_post(path)
    `curl --request POST \
    --url 'https://api.trello.com/1/#{path}#{AUTH}'`
end