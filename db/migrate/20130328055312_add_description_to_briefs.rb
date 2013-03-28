class AddDescriptionToBriefs < ActiveRecord::Migration
  def change
  	add_column :briefs, :intro, :text
  	
  end
end
