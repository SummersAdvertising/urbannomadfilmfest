class AddDateScheduleInnerPhotoToBrief < ActiveRecord::Migration
  def change
  	add_column :briefs, :date, :timestamp
  	add_column :briefs, :inner_photo, :string
  	add_column :briefs, :schedule, :string  	
  end
end
