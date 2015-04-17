class Pick < ActiveRecord::Base
	belongs_to :user
	validates :past, presence: true
end






















