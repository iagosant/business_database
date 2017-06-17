class AddColumnToBusinesses < ActiveRecord::Migration
  def up
    add_column :businesses, :account_active, :boolean, default: false
    add_column :businesses, :business_address, :string
    add_column :businesses, :category_code, :string
    add_column :businesses, :category_name, :string
    add_column :businesses, :class_code, :integer
    add_column :businesses, :class_name, :string
    add_column :businesses, :email, :string
    add_column :businesses, :mailing_addres, :string
    add_column :businesses, :name, :string
    add_column :businesses, :physical_location, :string
    add_column :businesses, :phone, :string
    add_column :businesses, :start_date, :date
    add_column :businesses, :taxes_current, :boolean, default: false
    add_column :businesses, :units, :integer
  end
  def down
    remove_column :businesses, :account_active
    remove_column :businesses, :business_address
    remove_column :businesses, :category_code
    remove_column :businesses, :category_name
    remove_column :businesses, :class_code
    remove_column :businesses, :class_name
    remove_column :businesses, :email
    remove_column :businesses, :mailing_addres
    remove_column :businesses, :name
    remove_column :businesses, :physical_location
    remove_column :businesses, :phone
    remove_column :businesses, :start_date
    remove_column :businesses, :taxes_current
    remove_column :businesses, :units
  end
end
