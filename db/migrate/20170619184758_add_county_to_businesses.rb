class AddCountyToBusinesses < ActiveRecord::Migration
  def up
    add_column :businesses, :county, :string
  end
  def down
    remove_colum :businesses, :county
  end
end
