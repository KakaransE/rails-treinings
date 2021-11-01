class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :fuel
      t.string :inspection
      t.string :score

      t.timestamps
    end
  end
end
