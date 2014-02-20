class Project < ActiveRecord::Base
	### Presence ###
	validates_presence_of :name, :description, :url

	### Uniqueness ###
	validates_uniqueness_of :name
	
	mount_uploader :image, AvatarUploader 

	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :crop_avatar

	def crop_avatar
		image.recreate_versions! if crop_x.present?
	end

end
