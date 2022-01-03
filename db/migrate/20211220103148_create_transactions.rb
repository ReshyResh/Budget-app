class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :transaction_number
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
