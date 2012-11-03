class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :website
      t.string :email
      t.text :description
      t.references :category

      t.timestamps
    end
    add_index :companies, :category_id
  end
end
