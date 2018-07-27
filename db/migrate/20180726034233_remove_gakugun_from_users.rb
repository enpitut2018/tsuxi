class RemoveGakugunFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :gakugun, :string
  end
end
