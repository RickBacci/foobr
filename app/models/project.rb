class Project < ActiveRecord::Base

  belongs_to :client

  has_many :developers, through: :clients

  validates :name, presence: true
end
