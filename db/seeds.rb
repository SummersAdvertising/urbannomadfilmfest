# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = Admin.new

# Attributes for the user
@attrib = {
  :username => "admin", 
  :password => "40bd001563085fc35165329ea1ff5c5ecbdbbeef",
  :name => "後台管理者"
}

# Use 'send' to call the attributes= method on the object
@user.send :attributes=, @attrib

@user.master = true

# Save the object
@user.save

# Define categories for languages
@full_category = Category.new
@short_category = Category.new
I18n.locale = :en
@full_category.title = "Full-length"
@full_category.namehash = "full"
@full_category.save

@short_category.title = "Short-length"
@short_category.namehash = "short"
@short_category.save

I18n.locale = :zh_TW
@full_category.title = "長片"
@full_category.save
@short_category.title = "短片"
@short_category.save
