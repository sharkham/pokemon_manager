class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.string :description
      t.string :pokemon_type
      t.integer :number
    end
  end
end
