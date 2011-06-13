class RemoveMp3tunesPlaylists < ActiveRecord::Migration
  def self.up
    drop_table :mp3tunes_playlists
  end

  def self.down
    create_table :mp3tunes_playlists, :id => false do |t|
      t.references :mp3tunes, :null => false
      t.references :playlists, :null => false
    end
  end
end
