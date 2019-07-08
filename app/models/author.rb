class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def name
    return "#{first_name} #{last_name}"
  end

  def self.ordered_by_last_name
    return Author.order(:last_name)
  end
  
  def books_ordered_by_title
    return books.order(:title)
  end

  def self.find_author(first_name,last_name)
    author = nil
    authors = Author.where("LOWER(last_name) = ? AND LOWER(first_name) = ?", last_name.downcase.strip, first_name.downcase.strip)
    if (authors)
      author = authors.first
    end
    return author
  end

  def self.create_author(first_name, last_name)
    author = Author.find_author(first_name,last_name)
    if(!author)
      author = Author.new(first_name: first_name,last_name: last_name)
      author.save
    end
    return author
  end
end
