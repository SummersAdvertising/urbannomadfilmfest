class CreateBriefPhotos < ActiveRecord::Migration
  def change
    create_table :brief_photos do |t|
      t.string :image
      t.integer :brief_id

      t.timestamps
    end
  end
end
