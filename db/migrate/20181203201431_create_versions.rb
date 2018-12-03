class CreateVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :versions do |t|
      t.string :number, null: false
      t.datetime :date_publication
      t.string :title
      t.text :description
      t.string :author
      t.string :maintainers

      t.timestamps
    end
  end
end
