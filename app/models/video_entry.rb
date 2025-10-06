class VideoEntry < ApplicationRecord
  has_one :entry, as: :entryable, touch: true
end
