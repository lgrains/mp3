class CreateMp3tunesPlaylists < ActiveRecord::Migration
  def self.up
    create_table :mp3tunes_playlists, :id => false do |t|
      t.references :mp3tunes, :null => false
      t.references :playlists, :null => false
    end
  end

  def self.down
    drop_table :mp3tunes_playlists
  end
end
