class MatchesController < InheritedResources::Base
  def destroy
    destroy! { root_url }
  end
end
