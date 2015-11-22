class Match < ActiveRecord::Base
  belongs_to :bomb
  belongs_to :photo
end
