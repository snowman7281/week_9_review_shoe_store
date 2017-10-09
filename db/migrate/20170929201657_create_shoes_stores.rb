class CreateShoesStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes_stores) do |b|
      b.column(:shoe_id, :integer)
      b.column(:store_id, :integer)

      b.timestamps()
    end
  end
end
