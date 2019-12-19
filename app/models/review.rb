class Review < ApplicationRecord
  validates :content, presence: :true
  validates :stars, presence: :true, inclusion: { in: 0..5, allow_nil: false}
  belongs_to :cocktail

  def blank_stars
    5 - stars.to_i
  end
end
