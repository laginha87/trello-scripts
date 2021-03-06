require 'json'
require 'uri'
load "./env.rb"

AUTH = "&key=#{TRELLO_APP_KEY}&token=#{TRELLO_TOKEN}"

def get(path)
    JSON.parse `curl --request GET \
    --url 'https://api.trello.com/1/#{URI.escape(path)}#{AUTH}'`
end


def simple_post(path)
    `curl --request POST \
    --url 'https://api.trello.com/1/#{path}#{AUTH}'`
end


def put(path)
    `curl --request PUT \
    --url 'https://api.trello.com/1/#{URI.escape(path)}#{AUTH}'`
end

def simple_delete(path)
    `curl --request DELETE \
    --url 'https://api.trello.com/1/#{path}#{AUTH}'`
end


def get_labels(board_id)
    get "boards/#{board_id}/labels?cards=none&card_fields=all&filter=open&fields=all"
end


def get_lists(board_id)
    get "boards/#{board_id}/lists?cards=none&card_fields=all&filter=open&fields=all"
end