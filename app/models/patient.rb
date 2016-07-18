class Patient < ActiveRecord::Base
	has_and_belongs_to_many :tags
	belongs_to :human
	belongs_to :user
end
