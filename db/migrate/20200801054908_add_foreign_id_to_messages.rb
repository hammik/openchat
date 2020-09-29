class AddForeignIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :user_id, :integer ,foreign_key: true
    add_column :messages, :group_id, :integer,foreign_key: true
  end
end
