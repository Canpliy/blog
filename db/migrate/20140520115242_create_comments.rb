class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :content
      t.references :review, polymorphic: true, index: true

      t.timestamps
    end
  end
end
