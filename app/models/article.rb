class Article < ActiveRecord::Base

  include TagsHelper

  default_scope { order('created_at DESC') }
  has_many :tags, as: :label, dependent: :destroy
  has_many :comments, as: :review, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

end
