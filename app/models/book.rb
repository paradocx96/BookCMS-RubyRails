class Book < ApplicationRecord
  # Validation for Book Title
  validates :title, presence: true

  # Validation for Book Author
  validates :author, presence: true, length: { minimum: 2 }

  # Validation for Book Genre
  validates :genre, presence: true, length: { minimum: 2 }

  # Validation for Book Publication Year
  validates :publication_year, presence: true, length: { maximum: 4 }, numericality: { only_integer: true }
end
