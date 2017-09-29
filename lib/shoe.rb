class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  number_to_currency(price, :unit => "$")
end
