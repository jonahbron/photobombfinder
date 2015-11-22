class BombsController < InheritedResources::Base

  actions :new, :create

  def begin_of_association_chain
    current_user
  end

  private

    def bomb_params
      params.require(:bomb).permit(:latitude, :longitude, :accuracy)
    end

end
