class Tag < ActiveRecord::Base
  belongs_to :label, polymorphic: true
end
