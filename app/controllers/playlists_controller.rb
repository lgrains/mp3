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
    @artists = Mp3tune.select(:id).select(:artist)
    debugger
    @option_tags = {}
    @option_tags[0] = "--Choose One--"
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
      artist_to_use = Mp3tune.where("artist = ?", Mp3tune.find(params[:artist]))
    @playlist = Playlist.new(params[:playlist])

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
