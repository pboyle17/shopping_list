class AccountsController < ApplicationsController

  get '/' do
    erb :login
  end

  get '/register' do
    erb :register
  end

  post '/' do

    user = Account.authenticate(params[:user_name],params[:password])
    # binding.pry
    if user
      p 'made it to if statement of user block'
      session[:current_user]=user
      redirect '/login/success'

    else
      p 'made it to the else statement of if user'

      redirect '/login/incorrect'
    end
  end

  get '/register' do
    erb :register
  end

  post '/register' do

    if does_user_exist(params[:user_name]) == true
      return {:message => 'womp, womp... user exists'}.to_json
    end

    user = Account.create( user_name: params[:user_name], password: params[:password])
    session[:current_user]=user
    # redirect '/success'
    @users=Account.all
    return @users.to_json

  end

  get '/success' do
    erb :success
  end

  get '/incorrect' do
    erb :incorrect
  end

end
