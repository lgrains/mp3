class PlaylistsController < ApplicationController
  # GET /playlists
  # GET /playlists.xml
  # def index
  #     @playlists = Playlist.all
  #
  #     respond_to do |format|
  #       format.html # index.html.erb
  #       format.xml  { render :xml => @playlists }
  #     end
  #   end
  #
  #   # GET /playlists/1
  #   # GET /playlists/1.xml
  #   def show
  #     @playlist = Playlist.find(params[:id])
  #
  #     respond_to do |format|
  #       format.html # show.html.erb
  #       format.xml  { render :xml => @playlist }
  #     end
  #   end

  # GET /playlists/new
  # GET /playlists/new.xml
  def new
    @playlist = Playlist.new
    @artists = Mp3tune.select(:id).select(:artist).group(:artist)
    @option_tags = {}
    5.times do |i|
      @option_tags[i+1] = i+1
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @playlist }
    end
  end

  # # GET /playlists/1/edit
  # def edit
  #   @playlist = Playlist.find(params[:id])
  # end

  # POST /playlists
  # POST /playlists.xml
  def create
    debugger
    if params[:artist_name]
      #params[:artist] is the mp3tunes.id number
      mp3list = Mp3tune.where("artist = ?",Mp3tune.find(params[:artist]).artist)
    end
    if params[:minimum_rating]
      #find all mp3's with rating >= params[:min_rating]
      Mp3tune.all.each do |tune|
        if tune.rating_value >= params[:min_rating]
          mp3list << tune unless mp3list.include?(tune)
        end
      end
    end
    @playlist = Playlist.new
    @playlist.mp3tunes << mp3list

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to(new_playlist_path, :notice => 'Playlist was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /playlists/1
  # PUT /playlists/1.xml
  # def update
  #    @playlist = Playlist.find(params[:id])
  #
  #    respond_to do |format|
  #      if @playlist.update_attributes(params[:playlist])
  #        format.html { redirect_to(@playlist, :notice => 'Playlist was successfully updated.') }
  #        format.xml  { head :ok }
  #      else
  #        format.html { render :action => "edit" }
  #        format.xml  { render :xml => @playlist.errors, :status => :unprocessable_entity }
  #      end
  #    end
  #  end
  #
  #  # DELETE /playlists/1
  #  # DELETE /playlists/1.xml
  #  def destroy
  #    @playlist = Playlist.find(params[:id])
  #    @playlist.destroy
  #
  #    respond_to do |format|
  #      format.html { redirect_to(playlists_url) }
  #      format.xml  { head :ok }
  #    end
  #  end
end
