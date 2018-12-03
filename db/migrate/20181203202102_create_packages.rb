class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name, null: false
      t.references :latest_version, index: true, foreign_key: { to_table: :versions }

      t.timestamps
    end

    add_reference :versions, :package, index: true
  end
end
