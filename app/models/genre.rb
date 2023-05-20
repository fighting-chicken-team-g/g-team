class Genre < ApplicationRecord
  has_many :foods, dependent: :destroy
  validates :genre_name, presence: true, uniqueness: true
end
