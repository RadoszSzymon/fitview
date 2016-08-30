class AddActivityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activity, :string
  end
end
