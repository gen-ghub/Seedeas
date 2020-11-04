class Seed < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
  
  belongs_to :user
  has_one_attached :image


  validates :tag_id,numericality: { other_than: 1, message: 'must be other than --' }

  with_options presence: true do
    validates :title
    validates :idea
  end
end
