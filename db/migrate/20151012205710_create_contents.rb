class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :body
      t.string :authorization_status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
