class AddLastPostToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_post, :datetime
  end
end
