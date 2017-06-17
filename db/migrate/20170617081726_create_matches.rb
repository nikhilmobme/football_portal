class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :venue
      t.datetime :date
      t.integer :team1_id
      t.integer :team2_id

      t.timestamps
    end
  end
end
