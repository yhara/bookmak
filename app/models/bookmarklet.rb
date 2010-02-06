class Bookmarklet < ActiveRecord::Base
  belongs_to :author, :class_name => "User"

  has_many :bookmarklet_usages
  has_many :users, :through => :bookmarklet_usages

  validates_presence_of :title, :javascript, :author
  validates_length_of :title, :maximum => 200
  validates_length_of :javascript, :maximum => 10000
end
