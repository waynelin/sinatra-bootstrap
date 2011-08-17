require 'rubygems'
require 'sinatra'
require 'haml'

# Helpers
require './lib/render_partial'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public, 'public'
set :haml, {:format => :html5} # default Haml format is :xhtml
set :baseTitle, 'This is the base title'
set :redirects, {
  '/home' => '/'
}

# Redirects
settings.redirects.each do | oldlink, newlink |
  get oldlink do
    redirect newlink
  end
end

# Application routes
get '/' do
  @title = 'Home'
  haml :'pages/index', :layout => :'layouts/application'
end

get '/about' do
  @title = 'About'
  haml :'pages/about', :layout => :'layouts/application'
end

## Error (404/500) Pages

not_found do
  @title = 'Page not found!'
  haml :'errors/404', :layout => :'layouts/errors'
end