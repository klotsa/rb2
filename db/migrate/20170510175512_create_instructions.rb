class CreateInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table(:instructions) do |t|
      t.column(:name, :string)
      t.column(:description, :string)
      t.column(:rating, :integer)
    end
  end
end
