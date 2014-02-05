class Student < User
	# Validações
	validates_presence_of :institution
	validates_presence_of :semester

	## Foto
  mount_uploader :image, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar

  def crop_avatar
    image.recreate_versions! if crop_x.present?
  end
end
