class Publication < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  mount_uploader :avatar, AvatarUploader

  scope :random_publications, -> { order("RANDOM()").limit(3) }

  def self.author_publication(user, publication)
  	user.id == publication.user_id unless user.nil?
  end

end
