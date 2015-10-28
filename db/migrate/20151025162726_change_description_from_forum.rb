class ChangeDescriptionFromForum < ActiveRecord::Migration
  def up
  	change_column :forums, :description, :text
  end

  def down
  	change_column :forums, :description, :string
  end
end
