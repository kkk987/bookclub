class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  
  def self.get_average_rating(book)
    reviews = Review.select(:rating).where(book_id: book.id)
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    rating = "%.2f" % (sum.to_f / reviews.length) if sum > 0
    return rating
  end

end
