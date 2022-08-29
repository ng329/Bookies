class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rental_start, :rental_end, :total_price, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0,
                                          less_than: BigDecimal(10**3) },
                          format: {
                            with: /\A\d(\.\d{1,2})+\z/
                          }
end
