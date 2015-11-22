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

end
