class CreateFilmReviews < ActiveRecord::Migration
  def change
    create_table :film_reviews do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :image_url
      t.date :release_time
      t.decimal :level, precision: 2, scale: 0

      t.timestamps
    end
  end
end
