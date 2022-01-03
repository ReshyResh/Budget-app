class AddCategoryRefToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :category, null: false, foreign_key: true
  end
end
