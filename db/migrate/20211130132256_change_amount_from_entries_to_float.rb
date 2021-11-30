class ChangeAmountFromEntriesToFloat < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :amount
    add_column :entries, :amount, :float
  end
end
