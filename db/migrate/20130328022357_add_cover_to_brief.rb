class AddCoverToBrief < ActiveRecord::Migration
  def change
  	add_column :briefs, :cover, :string
  end
end
