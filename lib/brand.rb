class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
#  validates :name, :price, :numericality => true, :presence => true, :uniqueness => true 
  before_save(:uppercase_words)

#  validates :name, {:presence => true, format: { with: /\A[a-zA-Z]+\z/}}
end

private
  def uppercase_words
    #  self.name=(self.name.split.map(&:capitalize).join(' '))
     self.name=(name().capitalize())
   end
