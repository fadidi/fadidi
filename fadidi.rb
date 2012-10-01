require 'sinatra'

set :layout => :layout

get '/' do
  haml :index
end

get '/portfolio' do
  haml :portfolio
end

get '/pricing' do
  haml :pricing
end

get '/team' do
  haml :team
end

get '/products-services' do
  haml :products_services
end
