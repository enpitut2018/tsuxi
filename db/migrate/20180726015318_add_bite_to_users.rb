class AddBiteToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bite, :string
  end
end
