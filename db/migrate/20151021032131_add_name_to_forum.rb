class AddNameToForum < ActiveRecord::Migration
  def change
    add_column :forums, :name, :string
  end
end
