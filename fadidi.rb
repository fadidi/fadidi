require 'sinatra'

set :layout => :layout

get '/' do
  haml :index
end

get '/portfolio' do
  haml :portfolio
end

get '/team' do
  haml :team
end

get '/products-services' do
  haml :products_services
end

get '/digitalpost' do
  haml :digitalpost
end

get '/cms-ecommerce' do
  haml :cms_ecommerce
end

get '/contact' do
  haml :contact
end
