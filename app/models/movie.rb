class Movie < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
end
