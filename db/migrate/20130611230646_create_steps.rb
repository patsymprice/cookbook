class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :order
      t.text :description

      t.timestamps
    end
  end
end
