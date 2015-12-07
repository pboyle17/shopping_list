require 'sinatra/base'

require './controllers/application'
require './controllers/item'
require './models/item'
require './controllers/account'
require './models/account'

map('/login') {run AccountsController}
map('/list') {run ItemsController}
map('/') {run ApplicationsController}
