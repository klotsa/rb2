class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  #validates :name, :presence => true, :uniqueness => true
  before_save(:uppercase_words)
end

private

def uppercase_words
 self.name=(name().capitalize())
end
