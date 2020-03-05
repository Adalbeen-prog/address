class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.integer :psc
      t.belongs_to :person
      
      t.timestamps
    end
  end
end
