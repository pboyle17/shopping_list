class ItemController < ApplicationsController

  #Read
  get '/' do

    #create a collection of all the items
    @items=Item.all
    #render to the page with the home view
    erb :home
  end

  #Create

  get '/add' do
    erb :add
  end

  post '/add' do
    return params.to_json
  end


  #Update
  get '/update/:id' do

  end



  #Destroy




end
