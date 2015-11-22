class PhotosController < InheritedResources::Base

  actions :new, :create

  private

    def photo_params
      params.require(:photo).permit(:photo)
    end

end
