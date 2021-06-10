class Book < ApplicationRecord
  belongs_to :shelf
  validates :title, :author, :image_url, presence: true
  validates_uniqueness_of :title, scope: :shelf_id
end
