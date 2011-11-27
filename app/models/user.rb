class User < ActiveRecord::Base
	belongs_to :service
	validates :username,	:presence => true
	validates :password,	:presence => true,
							:length => { :minimum => 4}
end
