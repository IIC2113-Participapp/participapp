class RemoveOpinioinFromForum < ActiveRecord::Migration
  def change
    remove_column :forums, :opinion, :text
  end
end
