class City < ActiveRecord::Base
  validates :name, presence: true
  validates :region_id, presence: true

  belongs_to :region
  has_many :turbazas
end
