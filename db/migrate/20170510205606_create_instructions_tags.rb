class CreateInstructionsTags < ActiveRecord::Migration[5.1]
  def change
    create_table(:instructions_tags) do |t|
      t.column(:instruction_id, :int)
      t.column(:tag_id, :int)
    end
  end
end
