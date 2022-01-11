class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id,  null:false
      t.integer :prototype_id, null:false
      t.timestamps
    end
  end
end
