class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :stadium
      t.string :city

      t.timestamps
    end
  end
end
