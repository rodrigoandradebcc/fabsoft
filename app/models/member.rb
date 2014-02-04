class Member < User

	# Validações
    validates_presence_of :rg
    validates_presence_of :cpf
    validates_presence_of :entry_date
    validates_presence_of :address
    validates_length_of :cpf, minimum: 14, maximum: 14
    validates_length_of :address, minimum: 5
    validates_uniqueness_of :rg
    validates_uniqueness_of :cpf

    ## Foto
   	mount_uploader :image, AvatarUploader
   	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
   	after_update :crop_avatar

   	def crop_avatar
   		image.recreate_versions! if crop_x.present?
   	end

end
