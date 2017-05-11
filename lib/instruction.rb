class Instruction < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:tags)
  validates :name, {:presence => true, format: { with: /\A[a-zA-Z]+\z/}}
  before_save(:convert)

  private

    define_method(:convert) do
      self.name = name.capitalize()
    end
end
