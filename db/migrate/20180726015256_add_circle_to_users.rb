class AddCircleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :circle, :string
  end
end
