class BookmarkletUsage < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmarklet
end
