# Create a table for recipes; should have 'name', 'ingerdients', 'cook_time'

class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.string :cook_time
    end
  end
end
