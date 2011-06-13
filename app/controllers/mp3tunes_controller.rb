class Mp3tunesController < ApplicationController

  layout 'application'
  # GET /mp3tunes
  # GET /mp3tunes.xml
  def index
    @mp3tunes = Mp3tune.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mp3tunes }
    end
  end

  # GET /mp3tunes/1
  # GET /mp3tunes/1.xml
  def show
    @mp3tune = Mp3tune.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mp3tune }
    end
  end

  # GET /mp3tunes/new
  # GET /mp3tunes/new.xml
  def new
    @mp3tune = Mp3tune.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mp3tune }
    end
  end

  # GET /mp3tunes/1/edit
  def edit
    @mp3tune = Mp3tune.find(params[:id])
  end

  # POST /mp3tunes
  # POST /mp3tunes.xml
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

  # PUT /mp3tunes/1
  # PUT /mp3tunes/1.xml
  def update
    @mp3tune = Mp3tune.find(params[:id])

    respond_to do |format|
      if @mp3tune.update_attributes(params[:mp3tune])
        format.html { redirect_to(@mp3tune, :notice => 'Mp3tune was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mp3tune.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mp3tunes/1
  # DELETE /mp3tunes/1.xml
  def destroy
    @mp3tune = Mp3tune.find(params[:id])
    @mp3tune.destroy

    respond_to do |format|
      format.html { redirect_to(mp3tunes_url) }
      format.xml  { head :ok }
    end
  end
end
