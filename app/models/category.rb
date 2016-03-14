class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged
	has_many :classifieds

	scope :alpha, lambda { order("name ASC") }

	validates :name, presence: true

	def to_s
		name
	end
end
