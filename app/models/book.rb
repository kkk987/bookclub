class Book < ApplicationRecord
  has_many :book_list_items
  has_many :reviews
  has_many :users, through: :book_list_items
  has_one_attached :cover
  belongs_to :author

  validates :title, presence: true, uniqueness: true
  validates :genre, inclusion: {in: ["Romance", "SciFi", "Drama"]}

  def self.ordered_by_author_and_title
    books = []
    Author.all.order(:last_name).each do |author|
      books += author.books.order(:title)
    end
    return books
  end

  def self.find_book(title, author_last_name)
    book = nil
    books = Book.where("LOWER(title) = ?", title.downcase.strip)
    if books
      book = books.first
      if (book && book.author.last_name.downcase != author_last_name.downcase.strip)
        book = nil
      end
    end
    return book
  end

  def self.create_book(title, author, genre)
    book = Book.find_book(title,author.last_name)
    if(!book)
      book = Book.new(title: title, genre: genre, author_id: author.id)
      book.save
    end
    return book
  end

end
