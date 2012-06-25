class Session < ActiveRecord::Base
  attr_accessible :last_seen_at, :uuid
  
#  validates :uuid, presence: true, uniqueness: true
end
