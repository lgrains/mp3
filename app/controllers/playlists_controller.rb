class PlaylistsController < ApplicationController

  def new
    @artists = Mp3tune.select(:id).select(:artist).group(:id).group(:artist)
    @option_tags = {}
    5.times do |i|
      @option_tags[i+1] = i+1
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @playlist }
    end
  end

  def create
    if params[:artist_name] && params[:minimum_rating]
      set1 = Mp3tune.random_by_artist(params[:artist]).to_set #params[:artist] is the mp3tune_id of artist
      set2 = Mp3tune.random_by_min_rating(params[:min_rating].to_f).to_set
      @playlist = (set1 | set2)
    elsif !params[:artist_name] && !params[:minimum_rating]
      @playlist = Mp3tune.all.sort_by {rand}[0..Mp3tune.all.length]
    elsif params[:artist_name]
      @playlist = Mp3tune.random_by_artist(params[:artist]) #params[:artist] is the mp3tune_id of artist
    elsif params[:minimum_rating]
      @playlist = Mp3tune.random_by_min_rating(params[:min_rating].to_f)
    end

    render :partial => "extm3u"
  end
end
