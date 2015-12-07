class ApplicationsController < Sinatra::Base
  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :database=>'shopping_list',
    :adapter=>'postgresql'
  )

  enable :sessions

  set :views, File.expand_path('../../views',__FILE__)
  set :public_dir, File.expand_path('../../public',__FILE__)

  # not_found do
  #   erb :not_found
  # end

  def does_user_exist(username)
user = Account.find_by(:user_name => username)
if user
  return true
else
  return false
end
end

def authorization_check
if session[:current_user] == nil
  redirect '/not_authorized'
else
  return true
end
end

  get '/' do
    redirect '/login'
  end

end
