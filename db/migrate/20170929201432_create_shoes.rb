class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes) do |b|
      b.column(:brand, :string)
      b.column(:price, :integer)

      b.timestamps()
    end
  end
end
