class AddHeightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :height, :int
  end
end
