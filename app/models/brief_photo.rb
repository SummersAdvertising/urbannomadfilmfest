class BriefPhoto < ActiveRecord::Base
  belongs_to :brief

  attr_accessible :image
  
  mount_uploader :image, BriefPhotoUploader
  
end
