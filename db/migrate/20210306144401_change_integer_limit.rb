class ChangeIntegerLimit < ActiveRecord::Migration[6.1]
  def up
    change_column :admins, :phone, :bigint
    change_column :users, :phone, :bigint
  end

  def down
    change_column :admins, :phone, :integer
    change_column :users, :phone, :integer
  end

end
