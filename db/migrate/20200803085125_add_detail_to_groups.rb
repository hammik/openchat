class AddDetailToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :detail, :string
  end
end
