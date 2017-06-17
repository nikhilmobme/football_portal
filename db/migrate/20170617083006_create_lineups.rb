class CreateLineups < ActiveRecord::Migration[5.0]
  def change
    create_table :lineups do |t|
      t.references :match, foreign_key: true
      t.references :player, foreign_key: true
      t.references :team, foreign_key: true
      t.string :position
      t.boolean :is_caption
      t.boolean :is_keeper

      t.timestamps
    end
  end
end
