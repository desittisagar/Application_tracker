class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :yoe, :integer
    add_column :users, :skills, :string
    add_column :users, :resume, :string
    add_column :users, :phone, :interger
  end
end
