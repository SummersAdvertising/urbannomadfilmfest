class movie < ActiveRecord::Base
  has_many :classphotos, :dependent => :destroy
  attr_accessible :content, :name, :frontshow
  
  translates :content, :name, :frontshow

  accepts_nested_attributes_for :translations

  Translation.mount_uploader :frontshow, MoverCoverUploader
  
  def frontshow
  	self.translation.frontshow
  end
  
  def frontshow=(value)
  	self.translation.frontshow = value
  end
  
end