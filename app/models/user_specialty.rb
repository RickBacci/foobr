class UserSpecialty < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :user
end
