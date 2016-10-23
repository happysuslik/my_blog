class Publication < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  mount_uploader :avatar, AvatarUploader

  scope :random_publications, -> { order("RANDOM()").limit(3) }

end
