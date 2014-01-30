require 'rubygems'
require 'bundler'

Bundler.require
Dotenv.load

get '/' do
  client = Foursquare2::Client.new(
    client_id: ENV["API_CLIENT"],
    client_secret: ENV["CLIENT_SECRET"],
     api_version: "20130815"
  )
  result = client.search_venues(
    ll: "10.964112,-74.802582",
    near: "barranquilla",
    categoryId:"4bf58dd8d48988d1e2941735,4bf58dd8d48988d161941735"
  ).find { |data| data.first == "venues"}[1]
  haml :index, locals: {venues: result}
end
