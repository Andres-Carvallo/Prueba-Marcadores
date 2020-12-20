class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :url_name
      t.references :urlable, polymorphic: true

      t.timestamps
    end
  end
end
