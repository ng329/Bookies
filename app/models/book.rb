class Book < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :title, :blurb, :author, :genre, :price_per_day, :photo, presence: true
  validates :price_per_day, numericality: { greater_than_or_equal_to: 0,
                                            less_than: BigDecimal(10**3) },
                            format: {
                              with: /\A\d(\.\d{1,2})+\z/
                            }

  include PgSearch::Model
  pg_search_scope :search_book,
                  against: %i[title author genre],
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_genre,
                  against: %i[genre],
                  using: {
                    tsearch: { any_word: true }
                  }
end
