require 'sinatra'
require 'json'


# "{\"node_id\":\"1234\",
#\"readings\":[{\"temperature\":98.6,
#\"humidity\":31.4,\"time_taken\":\"2016-10-04T12:12.123\"},
#]}" 


# list all
get '/widgets' do
  "test"
end

post '/widgets' do
  widget = Widget.new(params['widget'])
  widget.save
  status 201
end

