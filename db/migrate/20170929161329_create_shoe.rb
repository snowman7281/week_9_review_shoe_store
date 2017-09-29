class CreateShoe < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoe) do |t|
      t.column(:brand, :string)
      t.column(:price, :decimal, :precision => 8, :scale => 2)

      t.timestamps()
    end
  end
end
