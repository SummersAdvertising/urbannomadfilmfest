class Brief < ActiveRecord::Base
  has_many :brief_photos
  belongs_to :category
  attr_accessible :content, :name, :new_create, :status, :cover, :intro
  
  mount_uploader :cover, MovieCoverUploader
  
  translates :name, :content, :intro
end
