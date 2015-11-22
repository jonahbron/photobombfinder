require 'exifr'

class PhotosController < InheritedResources::Base

  actions :new, :create, :show

  def create
    @photo = Photo.new(photo_params)
    @photo.save!
    exifr = EXIFR::JPEG.new(@photo.photo.path)
    latitude = exifr.gps.latitude
    longitude = exifr.gps.longitude
    min_latitude = latitude - 0.002700003
    max_latitude = latitude + 0.002700003
    min_longitude = longitude - 0.002700003
    max_longitude = longitude + 0.002700003
    Bomb.where(
      'latitude > ? AND latitude < ? AND longitude > ? AND longitude < ?',
      min_latitude,
      max_latitude,
      min_longitude,
      max_longitude
    ).each do |bomb|
      puts bomb
    end
    redirect_to root_url
  end

  private

    def photo_params
      params.require(:photo).permit(:photo)
    end

end
