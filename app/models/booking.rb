class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :rental_start, :rental_end, :total_price, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0,
                                          less_than: BigDecimal(10**3) },
                          format: {
                            with: /\A\d{1,3}(\.\d{1,2})?\z/
                          }
  before_validation :end_date_after_start_date, on: :create

  private

  def end_date_after_start_date
    return if rental_end.blank? || rental_start.blank?

    errors.add(:rental_end, "must be after the start date") if rental_end < rental_start
  end
end
