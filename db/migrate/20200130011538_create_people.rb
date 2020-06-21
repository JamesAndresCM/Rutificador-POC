class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :paternal
      t.string :maternal
      t.string :first_name
      t.string :last_name
      t.integer :rut
      t.string :location

      t.timestamps
    end
  end
end
