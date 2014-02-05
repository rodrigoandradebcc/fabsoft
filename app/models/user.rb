class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :trackable, :validatable

	validates_presence_of :login
	validates_length_of :name, maximum: 55, minimum: 2
	validates_length_of :login, maximum: 26, minimum: 6
	validates_uniqueness_of :login

	has_and_belongs_to_many :roles
	has_and_belongs_to_many :users


	def role?(r)
		self.roles.each do |rl|
			if rl[:name]==r
				return true
			end
		end
		return false
	end

end
