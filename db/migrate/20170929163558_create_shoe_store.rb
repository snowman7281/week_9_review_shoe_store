class CreateShoeStore < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoe_store) do |t|
      t.column(:shoe_id, :int)
      t.column(:store_id, :int)

      t.timestamps()
    end
  end
end
