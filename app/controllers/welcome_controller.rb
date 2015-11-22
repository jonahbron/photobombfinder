class WelcomeController < ApplicationController

	def index
		@photos = current_user.photos
	end

end
