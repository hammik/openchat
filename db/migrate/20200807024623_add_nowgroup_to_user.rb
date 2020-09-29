class AddNowgroupToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nowgroup, :integer
  end
end
