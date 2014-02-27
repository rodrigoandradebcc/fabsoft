class Course < ActiveRecord::Base
	has_and_belongs_to_many :users
	validates_numericality_of :workload, :maximum_capacity, :minimum_capacity, :greater_than => 0
	validates :user_ids, :presence => {:message => 'Selecione ao menos um instrutor'}
	validates :end_date, :start_date, :presence => {:message => 'Selecione uma data'}
	validate :capacity_validate
	validate :date_validate
	mount_uploader :image, ImageUploader
	attr_accessor

	private
	def capacity_validate
		if minimum_capacity > maximum_capacity
			errors.add("minimum_capacity", "A capacidade mínima deve ser menor que a capacidade máxima")      
		end    
	end
	
	def date_validate
		if date_compare(start_date, end_date)
			errors.add("start_date", "A data de início deve ser antes da data de término")      
		end    
	end
	
	def date_compare(date1, date2)
		y1 = date1.year
		y2 = date2.year
		m1 = date1.month
		m2 = date2.month
		d1 = date1.day
		d2 = date2.day
		
		if y1 > y2
			return true
		elsif m1 > m2
			if y1 < y2
				return false
			end
			return true
		elsif d1 > d2
			if m1 < m2
				return false
			elsif y1 < y2
				return false
			end
			return true
		end      
	end
end
