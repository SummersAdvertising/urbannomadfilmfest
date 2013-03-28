class AddCategoryIdToBriefs < ActiveRecord::Migration
  def change
  	add_column :briefs, :category_id, :integer
  end
end
