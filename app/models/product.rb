class Product < ActiveRecord::Base
	#Relations
	has_many :line_items

	#callbacks
	before_destroy :ensure_not_referenced_by_any_line_item

	#Addigng Image Uploader
	mount_uploader :image_url, ImageUploader

	#Validations
	validates :title, :description, :image_url, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format:{
		with: %r{\.(gif|jpg|png)\z}i,
		message: 'must be a URL for GIF, JPG, or PNG image.'
	}


	#Get the latest products
	def self.latest
		Product.order(:updated_at).last
	end

	private 
		# ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items Present')
				return false
			end		
		end



end
