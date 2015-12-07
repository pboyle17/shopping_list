class List < ActiveRecord::Base
  has_many :items
  has_many :accounts
end
