class AddGakugunToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gakugun, :string
  end
end
