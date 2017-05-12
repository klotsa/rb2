class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:price, :decimal, :precision => 15, :scale => 2)
    end
  end
end
