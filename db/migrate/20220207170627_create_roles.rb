class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :character_name
      t.integer :movie_id
      t.integer :person_id
      t.timestamps
    end
  end
end
