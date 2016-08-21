class AddWeightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :weight, :int
  end
end
