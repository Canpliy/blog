class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :signature
      t.string :password_digest
      t.string :img_url
      t.boolean :admin, default: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
