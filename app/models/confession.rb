class Confession < ActiveRecord::Base
  attr_accessible :content, :updated_at
  has_many :comments, dependent: :destroy

  validates :content, presence: true, uniqueness: true
end
