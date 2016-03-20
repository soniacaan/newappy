class PhotoAlbumnsController < ApplicationController
  before_filter :set_album


  
  def show
    @photo = @albumn.photo_albumn.find(params[:id])
  end

  def new
    @photo = @albumn.photo_albumns.new
  end

  def create
    @photo = @albumn.photo_albumns.new(params[:photo_albumn])
    @photo.album = @albumn
    if @photo.save
      redirect_to @albumn
    else
      render :new
    end
  end

  def edit
    @photo = @albumn.photo_albumns.find(params[:id])
  end

  def update
    @photo = @albumn.photo_albumns.find(params[:id])

    if @photo.update_attributes(params[:photo_albumn])
      redirect_to @albumn
    else
      render :edit
    end
  end

  private
  def set_album
    @albumn = Albumn.find(params[:album_id])
  end

end