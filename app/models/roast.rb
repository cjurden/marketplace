class Roast < ActiveRecord::Base
	#code for better looking hyperlink
	extend FriendlyId
    friendly_id :name, use: :slugged
    
	#attributes of roast
	belongs_to :user
	has_attached_file :image
	has_many :sales
	
	#image upload validation
	validates_attachment_content_type :image,
	content_type: /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"
	
	#requires image to be included in a new roast
	validates :image, attachment_presence: true
end
