class Recipes < ActiveRecord::Migration
  def change
    create_table :recipes do |r|
      r.string :name
      r.string :ingredients
    end
  end
end
