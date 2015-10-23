class CreateTurbazas < ActiveRecord::Migration
  def change
    create_table :turbazas do |t|
      t.string :name
      t.integer :city_id

      t.timestamps
    end
  end
end
