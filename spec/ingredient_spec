require('spec_helper')

describe(Ingredient) do

  describe("#instructions") do
    it("tells which instructions use this ingredient") do
      test_ingredient = Ingredient.new({:name => "chocolate"})
      test_instruction = test_ingredient.instructions.create({:name => "chocolate delight", :description => "the best ever", :rating => 5})
      expect(test_ingredient.instructions()).to(eq([test_instruction]))
    end
  end

  describe("#instruction") do
    it("insures alphabetic only input") do
      test_ingredient = Ingredient.new({:name => "12345"})
      expect(test_ingredient.save()).to(eq(false))
    end
  end

  describe Ingredient, type: :model do
    it { should validate_presence_of(:name) }
  end


end
