class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
#  validates :name, {:presence => true, format: { with: /\A[a-zA-Z]+\z/}}
end