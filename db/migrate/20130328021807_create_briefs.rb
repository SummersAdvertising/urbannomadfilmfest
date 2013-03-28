class CreateBriefs < ActiveRecord::Migration
  def change
    create_table :briefs do |t|
      t.string :name
      t.text :content
      t.boolean :new_create
      t.string :status

      t.timestamps
    end
  end
end
