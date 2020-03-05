class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :birthNumber
      t.string :phoneNumber
      t.string :sex
      t.string :dateOfBirth
      # t.references :location, index: true, foreign_key: true

      t.timestamps
    end
  end
end
