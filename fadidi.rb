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

get '/hostedpost' do
  haml :hostedpost
end

get '/why_hostedpost' do
  haml :why_hostedpost
end

get '/cms-ecommerce' do
  haml :cms_ecommerce
end

get '/bespoke' do
  haml :bespoke
end

get '/contact' do
  haml :contact
end

get '/ethos' do
  haml :ethos
end

post '/newsletter_subscribe' do
  Pony.mail(
    :to => params[:subscribe],
    :from => 'info@fadidi.com',
    :reply_to => 'info@fadidi.com',
    :subject => 'Thanks for your interest!',
    :body => haml(:subscribe_confirmation, :layout => false)
  )
  haml :newsletter_success
end

post '/send_contact_email' do
  Pony.mail(
    :to => 'support@fadidi.com',
    :from => params[:email],
    :reply_to => params[:email],
    :subject => "Info request from: #{params[:name]} <#{params[:email]}>",
    :body => params[:message]
  )
  haml :contact_email_success
end
