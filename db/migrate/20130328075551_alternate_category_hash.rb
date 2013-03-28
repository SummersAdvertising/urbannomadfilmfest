class AlternateCategoryHash < ActiveRecord::Migration
  def up
  	remove_column :categories, :hash
  	add_column :categories, :namehash, :string
  end

  def down
  	remove_column :categories, :namehash
  	add_column :categories, :hash, :string
  end
end
