class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      #t.string :name
      #t.integer :age
      t.string :email, null: false
      t.string :password_digest
      #t.integer :yoe
      #t.string :skills
      #t.string :resume
      #t.integer :phone

      t.timestamps
      add_foreign_key :User, :Job
    end
  end
end


# class CreateUsers < ActiveRecord::Migration[6.1]
#   def change
#     create_table :users do |t|
#       t.string :email, null: false
#       t.string :password_digest

#       t.timestamps
#     end
#   end
# end
