class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :picture

      t.timestamps
    end
  end
end
