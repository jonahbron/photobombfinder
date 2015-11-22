require 'exifr'

MARGIN = ENV['LOCATION_THRESHOLD'].to_f

class PhotosController < InheritedResources::Base

  actions :new, :create, :show

  def create
    exifr = EXIFR::JPEG.new(photo_params['photo'].tempfile.path)
    @photo = Photo.new(photo_params)
    @photo.taken_at = exifr.date_time_digitized.to_datetime.utc
    puts @photo.taken_at
    @photo.latitude = exifr.gps.latitude
    @photo.longitude = exifr.gps.longitude
    @photo.save!
    Bomb.where(
      'latitude > ? AND latitude < ? AND longitude > ? AND longitude < ? AND taken_at > ? AND taken_at < ?',
      @photo.latitude - MARGIN,
      @photo.latitude + MARGIN,
      @photo.longitude - MARGIN,
      @photo.longitude + MARGIN,
      @photo.taken_at - 5.minutes,
      @photo.taken_at + 5.minutes
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
