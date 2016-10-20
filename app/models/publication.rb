class Publication < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  mount_uploader :avatar, AvatarUploader
end
