require 'sinatra'
require 'pony'

configure do
  Pony.options = {
    :from => 'info@fadidi.com',
    :bcc => 'info@fadidi.com',
    :via => :smtp
  }
end

configure :development, :test do
  Pony.options[:via_options] = {
    :address => 'smtp.gmail.com',
    :port => '587',
    :user_name => 'jfbrown.wa@gmail.com',
    :password => 'vzLjoaRoBirJgkN',
    :authentication => :plain,
    :domain => 'localhost.localdomain'
  }
end

configure :production do
  Pony.options[:via_options] = {
    :address => ENV['MAILGUN_SMTP_SERVER'],
    :port => ENV['MAILGUN_SMTP_PORT'],
    :user_name => ENV['MAILGUN_SMTP_LOGIN'],
    :password => ENV['MAILGUN_SMTP_PASSWORD'],
    :authentication => :plain,
    :domain => ENV['DOMAIN']
  }
end

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

get '/ethos' do
  haml :ethos
end

get '/newsletter_subscribe' do
  Pony.mail(
    :to => params[:subscribe],
    :from => 'info@fadidi.com',
    :subject => 'Thanks for your interest!',
    :body => haml(:subscribe_confirmation, :layout => false)
  )
end
