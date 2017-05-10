class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table(:tags) do |t|
      t.column(:description, :string)
    end
  end
end
