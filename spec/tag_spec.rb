require('spec_helper')

describe(Tag) do
  describe("#instructions") do
    it("tells which tags are attached to this recipe") do
      test_tag = Tag.create({:description => "dessert"})
      test_instruction = test_tag.instructions.create({:name => "chocolate delight", :description => "the best ever", :rating => 5})
      expect(test_tag.instructions()).to(eq([test_instruction]))
    end
  end
end
