class Publication < ApplicationRecord
  belongs_to :user
  validates :title, :description, :avatar, presence: true
end
