require('spec_helper')

describe(Brand) do
  describe("#stores") do
    it("tells which brands are attached to this store") do
      test_brand = Brand.create({:name => "Nike"})
      test_store = test_brand.stores.create({:name => "Zappos"})
      expect(test_brand.stores()).to(eq([test_store]))
    end
  end

  describe("#stores") do
    it("ensure name is capitalized") do
      test_brand = Brand.create({:name => "nike"})
      expect(test_brand.name()).to eq("Nike")
    end
  end
end
