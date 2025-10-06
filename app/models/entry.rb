class Entry < ApplicationRecord
   delegated_type :entryable, types: %w[PostEntry VideoEntry]
  # belongs_to :entryable, polymorphic: true
end
