class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :description
      t.string :industry

      t.timestamps
    end
  end
end
