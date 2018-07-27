class AddGakuruiToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gakurui, :string
  end
end
