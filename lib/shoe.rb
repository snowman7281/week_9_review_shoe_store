class Shoe < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  # validates (:brand, uniqueness: true)
  validates(:brand, :presence => true)
  validates(:price, :presence => true)
  before_save(:upcase_shoe_name)


  private
  def upcase_shoe_name()
    brand = self.brand.split(" ")
    self.brand = brand.map{|word| word.capitalize}.join(" ")
  end
end
