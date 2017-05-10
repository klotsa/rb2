class CreateIngredientsInstructions < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients_instructions) do |t|
      t.column(:ingredient_id, :int)
      t.column(:instruction_id, :int)
    end
  end
end
