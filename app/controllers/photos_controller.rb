class PhotosController < InheritedResources::Base

  actions :new, :create, :show

  private

    def photo_params
      params.require(:photo).permit(:photo)
    end

end
