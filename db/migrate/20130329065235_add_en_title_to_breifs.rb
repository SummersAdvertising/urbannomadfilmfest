class AddEnTitleToBreifs < ActiveRecord::Migration
  def change
  	remove_column :brief_translations, :name
  	add_column :briefs, :name, :string
  	add_column :briefs, :en_name, :string
  end
end
