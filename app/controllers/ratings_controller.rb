class RatingsController < ApplicationController


  def new
    @rating = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating }
    end
  end


  def create
    @rating = Rating.new(params[:rating])
    @rating.mp3tune_id = params[:mp3tune_id]

    respond_to do |format|
      if @rating.save
        format.html { redirect_to(mp3tunes_path, :notice => 'Rating was successfully created.') }
      else
        format.html { render :action => "new", :notice => 'Errors prevented saving this rating' }
      end
    end
  end


end
