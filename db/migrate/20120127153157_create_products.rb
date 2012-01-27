class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :status, :default => 'Coming Soon'
      t.boolean :deleted, :default => false

      t.timestamps
    end
  end
end
