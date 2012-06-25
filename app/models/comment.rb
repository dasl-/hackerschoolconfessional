class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :confession

  validates :content, presence: true

end
