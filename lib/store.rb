class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes)
  # validates (:name, uniqueness: true)
  validates(:name, :presence => true)
  before_save(:upcase_store_name)

  private
  def upcase_store_name()
    name = self.name.split(" ")
    self.name = name.map{|word| word.capitalize}.join(" ")
  end
end
