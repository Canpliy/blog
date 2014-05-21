class Comment < ActiveRecord::Base
  default_scope { order('created_at') }
  belongs_to :review, polymorphic: true
end
