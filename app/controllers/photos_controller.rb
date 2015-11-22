require 'exifr'

MARGIN = 0.002700003

class PhotosController < InheritedResources::Base

  actions :new, :create, :show

  def create
    @photo = Photo.new(photo_params)
    @photo.save!
    exifr = EXIFR::JPEG.new(photo_params['photo'].tempfile.path)
    taken_at = exifr.date_time_digitized.to_datetime
    Bomb.where(
      'latitude > ? AND latitude < ? AND longitude > ? AND longitude < ? AND taken_at > ? AND taken_at < ?',
      exifr.gps.latitude - MARGIN,
      exifr.gps.latitude + MARGIN,
      exifr.gps.longitude - MARGIN,
      exifr.gps.longitude + MARGIN,
      taken_at - 5.minutes,
      taken_at + 5.minutes
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
