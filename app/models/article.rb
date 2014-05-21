class Article < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  has_many :tags, as: :label, dependent: :destroy
  has_many :comments, as: :review, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  def tags_to_s
    rest = ''
    tags.each do |tag|
      rest << (tag.name + " ")
    end
    rest
  end
end
