class ItemsController < ApplicationsController

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
    @item=Item.new
    @item.name=params[:name]
    @item.quantity=params[:quantity]
    @item.save
    @confirmation_message='your item has been added to your shopping list!'

    erb :confirmation
  end


  #Update
  get '/update/:id' do
    #get the item model from id symbol in url
    @item=Item.find(params[:id])
    erb :update
  end

#finding the actual row in the database and updating it.
  post '/update' do
    @item=Item.find(params[:id])
    @item.name=params[:name]
    @item.quantity=params[:quantity]
    @item.save
    @message='your item has been updated'
    erb :confirmation
  end



  #Destroy
  get '/delete/:id' do
    @item=Item.find(params[:id])

    erb :delete
  end

  post '/delete' do
    @item=Item.find(params[:id])
    @item.destroy
    @message='the item has been deleted'
    erb :confirmation
  end



end
