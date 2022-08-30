class Book < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :blurb, :author, :genre, :address, :price_per_day, presence: true
  validates :price_per_day, numericality: { greater_than_or_equal_to: 0,
                                            less_than: BigDecimal(10**3) },
                            format: {
                              with: /\A\d(\.\d{1,2})+\z/
                            }
end
