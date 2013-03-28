class Category < ActiveRecord::Base
  has_many :briefs
  attr_accessible :namehash, :title
  
  translates :title
end
