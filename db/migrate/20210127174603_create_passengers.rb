class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.text :name
      t.text :email
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
