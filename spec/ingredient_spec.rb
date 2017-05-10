require('spec_helper')

describe(Ingredient) do
  describe("#instructions") do
    it("tells which instructions use this ingredient") do
      test_ingredient = Ingredient.create({:name => "chocolate"})
      test_instruction = test_ingredient.instructions.create({:name => "chocolate delight", :description => "the best ever", :rating => 5})
      expect(test_ingredient.instructions()).to(eq([test_instruction]))
    end
  end
end
