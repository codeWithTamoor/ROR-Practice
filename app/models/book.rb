class Book < ApplicationRecord
  # Associations
  has_many :reviews
  belongs_to :supplier
  belongs_to :author

Book.transaction do
  book = Book.lock("LOCK IN SHARE MODE").find(1)
  book.increment!(:views)
end

# default scopr
# default_scope { where(out_of_print: false) }
scope :cheap, -> { where("price < 3000") }
scope :first_ten, -> { first(10) }

# passing args
scope :more_than_amount, ->(amount) { where("price > ?", amount) }
# condition
scope :created_before, ->(time) { where(created_at: ...time) if time.present? }
scope :out_of_print, -> { where(out_of_print: true) }

scope :recent, -> { where(year_published: 50.years.ago.year..) }
scope :old, -> { where(year_published: ...50.years.ago.year) }
# Custom extending block for the cheap scope
# Inside Rails console or a relation
extending do
  def cheap
    where("price < 3500")
  end
end.cheap
end
