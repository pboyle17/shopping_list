# models are how we interact with the database

class Item < ActiveRecord::Base
  self.table_name='item'
end
