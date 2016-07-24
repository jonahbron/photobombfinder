class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @matches = current_user.matches.order created_at: :desc
    @new_matches = @matches.where(seen_at: nil)
    @new_matches.each do |match|
      match.seen_at = Time.now
      match.save!
    end
  end

  def letsencrypt
    render text: '_dOCGLyz1ehBMLF8duhIcl9K6TrC9Q-z4AGvdVF55Gw.nujV0U5EgywTyj_uitKUHqL3UfYg4L7ec_3STruxmDs'
  end

end
