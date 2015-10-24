class AddLastReceivedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_received, :datetime
  end
end
