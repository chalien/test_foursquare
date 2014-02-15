require 'sinatra'
require 'rubygems'
require 'bundler'

Bundler.require
Dotenv.load

get '/' do
 result = client.search_venues(
    ll: "10.964112,-74.802582",
    near: "barranquilla",
    categoryId:"4bf58dd8d48988d1e2941735,4bf58dd8d48988d161941735"
  ).find { |data| data.first == "venues"}[1]
  haml :index, locals: {venues: result}
end


get "/place/:id" do
 venue = client.venue(params[:id])
 haml :show, locals: {venue: venue}
end
