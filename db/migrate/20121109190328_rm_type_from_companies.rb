class RmTypeFromCompanies < ActiveRecord::Migration
  def up
    remove_column :companies, :type
  end

  def down
    add_column :companies, :type, :string
  end
end
