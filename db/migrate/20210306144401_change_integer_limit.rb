class ChangeIntegerLimit < ActiveRecord::Migration[6.1]
  def change
    change_column :admins, :phone, :integer, limit: 8
    change_column :users, :phone, :integer, limit: 8
  end
end
