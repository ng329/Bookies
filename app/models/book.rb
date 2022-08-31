class Book < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  validates :title, :blurb, :author, :genre, :price_per_day, :photo, presence: true
  validates :price_per_day, numericality: { greater_than_or_equal_to: 0,
                                            less_than: BigDecimal(10**3) },
                            format: {
                              with: /\A\d(\.\d{1,2})+\z/
                            }
end
