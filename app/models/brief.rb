class Brief < ActiveRecord::Base
  has_many :brief_photos
  belongs_to :category
  attr_accessible :content, :name, :en_name, :new_create, :status, :cover, :intro, :date, :inner_photo, :schedule
  
  serialize :schedule
  
  mount_uploader :cover, MovieCoverUploader
  mount_uploader :inner_photo, InnerPhotoUploader
  
  translates :content, :intro, :fallbacks_for_empty_translations => true
  
  before_save :fill_empty_date
  
  def fill_empty_date
  
  	if self.date.nil?
  		self.date = Time.now
  	end
  
  end
  
end