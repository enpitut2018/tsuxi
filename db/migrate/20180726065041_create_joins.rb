class CreateJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :joins do |t|
      t.references :user, null:false
      t.references :community, null:false

      t.timestamps
    end
  end
end
