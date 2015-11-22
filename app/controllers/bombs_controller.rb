class BombsController < InheritedResources::Base

  actions :new, :create

  def create
    create! :notice => 'Great, we\'ll let you know when you\'ve found your photobomb.'
  end

  def begin_of_association_chain
    current_user
  end

  private

    def bomb_params
      params.require(:bomb).permit(:latitude, :longitude, :accuracy)
    end

end
