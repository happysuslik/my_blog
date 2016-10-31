class Publication < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, :description, presence: true
  mount_uploader :avatar, AvatarUploader

  scope :random_publications, -> { order("RANDOM()").limit(3) }

  private

  def self.author_publication(user, publication)
  	user.id == publication.user_id unless user.nil?
  end

  def self.reviews(current_user, publication)
  	if current_user.id != publication.user_id
  		review = publication.reviews.new(user_id: current_user.id)
  		if publication.reviews.find_by(user_id: current_user.id).nil?
  			review.save
  		end
  	end

  	publication.reviews.count
  end

  Publication.per_page = 6

end
