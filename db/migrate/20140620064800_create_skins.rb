class CreateSkins < ActiveRecord::Migration
  def change
    create_table :skins do |t|
      t.string :name
      t.string :background_color
      t.string :background_image
      t.string :home_image
      t.string :article_image
      t.string :film_review_image
      t.string :music_image
      t.string :setting_image
      t.string :skin_image

      t.timestamps
    end
  end
end
