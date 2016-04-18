class CreateIllustrations < ActiveRecord::Migration
  def change
    create_table :illustrations do |t|
      t.integer :song_id
      t.binary :illustration
      t.integer :illustrator_id

      t.timestamps null: false
    end
  end
end
