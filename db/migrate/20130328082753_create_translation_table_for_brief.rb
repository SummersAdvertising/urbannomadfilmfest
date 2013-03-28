class CreateTranslationTableForBrief < ActiveRecord::Migration
  def up
  	remove_column :briefs, :name, :intro, :content
  	Brief.create_translation_table! :name => :string, :intro => :text, :content => :text
  end

  def down
  	add_column :briefs, :name, :string
  	add_column :briefs, :intro, :text
  	add_column :briefs, :content, :text
  	Brief.drop_trahslation_table!
  end
end
