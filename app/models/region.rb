class Region < ActiveRecord::Base
  validates :name, presence: true
  validates :country_id, presence: true

  belongs_to :country
  has_many :cities
end
