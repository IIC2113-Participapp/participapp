class AddPeriodicityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :periodicity, :integer
  end
end
