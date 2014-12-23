class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title, case_sensitive: false

  scope :search_by_title, lambda {|term| where("lower(books.title) LIKE ?", "%#{term}%")}
end
