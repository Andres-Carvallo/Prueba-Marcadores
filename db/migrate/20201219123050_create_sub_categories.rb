class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.boolean :privacy
      
      t.timestamps
    end
  end
end
