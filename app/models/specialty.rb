class Specialty < ActiveRecord::Base
  has_many :user_speciaties
  has_many :users, through: :user_speciaties
end
