class CreateMp3tunes < ActiveRecord::Migration
  def self.up
    create_table :mp3tunes do |t|
      t.string :url
      t.string :title
      t.string :artist
      t.integer :length

      t.timestamps
    end
  end

  def self.down
    drop_table :mp3tunes
  end
end
