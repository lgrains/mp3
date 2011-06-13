class Mp3tunesController < ApplicationController

  layout 'application'

  def index
    @mp3tunes = Mp3tune.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mp3tunes }
    end
  end

  def show
    @mp3tune = Mp3tune.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mp3tune }
    end
  end

  def new
    @mp3tune = Mp3tune.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mp3tune }
    end
  end

  def create
    @mp3tune = Mp3tune.new(params[:mp3tune])

    respond_to do |format|
      if @mp3tune.save
        format.html { redirect_to(@mp3tune, :notice => 'Mp3tune was successfully created.') }
        format.xml  { render :xml => @mp3tune, :status => :created, :location => @mp3tune }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mp3tune.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @mp3tune = Mp3tune.find(params[:id])
    @mp3tune.destroy

    respond_to do |format|
      format.html { redirect_to(mp3tunes_url,:notice => 'Mp3tune was successfully removed.') }
      format.xml  { head :ok }
    end
  end
end
