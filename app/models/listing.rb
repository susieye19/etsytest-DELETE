class Listing < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpg",
										:storage => :dropbox,
										:dropbox_credentials => Rails.root.join("config/dropbox.yml")
	belongs_to :user
	has_many :orders


	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates_attachment_presence :image


end
