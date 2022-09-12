class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.integer :reg_type
      t.boolean :acceptance
      t.references :pet, foreign_key: true 
      t.references :user, foreign_key: true 
      
      t.timestamps
    end
  end
end
