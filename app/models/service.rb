class Service < ActiveRecord::Base
	validates :name,		:presence => true
	validates :image_ref,	:presence => true
	has_many :users, :dependent => :destroy
end
