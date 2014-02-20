class Partner < ActiveRecord::Base
	### Presence ###
	validates_presence_of :name, :description, :url

	### Uniqueness ###
	validates_uniqueness_of :name

	### Format ###
	validates_format_of :url, with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :multiline => true

	mount_uploader :image, AvatarUploader


	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :crop_avatar

	def crop_avatar
		image.recreate_versions! if crop_x.present?
	end

end
