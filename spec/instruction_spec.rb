
require('spec_helper')

describe(Instruction) do
  describe("#ingredients") do
    it("tells which ingredients are in this recipe") do
      test_instruction = Instruction.create({:name => "chocolate delight", :description => "the best ever", :rating => 5})
      test_ingredient = test_instruction.ingredients.create({:name => "chocolate"})
      expect(test_instruction.ingredients()).to(eq([test_ingredient]))
    end
  end
  describe("#tags") do
    it("tells which tags this instruction has") do
      test_instruction = Instruction.create({:name => "chocolate delight", :description => "the best ever", :rating => 5})
      test_tag = test_instruction.tags.create({:description => "bestest"})
      expect(test_instruction.tags()).to(eq([test_tag]))
    end
  end
end
