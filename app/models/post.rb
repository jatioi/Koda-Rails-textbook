class Post < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  validates :title, presence: true
  validates :content, presence: true
  validates_inclusion_of :published, in: [true, false]
  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
  belongs_to :user
  mount_uploader :image, ImageUploader



  def destroy
    update(deleted_at: Time.now)
  end
end