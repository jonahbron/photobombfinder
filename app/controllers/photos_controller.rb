require 'exifr'

MARGIN = 0.002700003

class PhotosController < InheritedResources::Base

  actions :new, :create, :show

  def create
    @photo = Photo.new(photo_params)
    @photo.save!
    exifr = EXIFR::JPEG.new(@photo.photo.path)
    Bomb.where(
      'latitude > ? AND latitude < ? AND longitude > ? AND longitude < ?',
      exifr.gps.latitude - MARGIN,
      exifr.gps.latitude + MARGIN,
      exifr.gps.longitude - MARGIN,
      exifr.gps.longitude + MARGIN
    ).each do |bomb|
      Match.create bomb_id: bomb.id, photo_id: @photo.id
    end
    redirect_to @photo
  end

  private

    def photo_params
      params.require(:photo).permit(:photo)
    end

end
