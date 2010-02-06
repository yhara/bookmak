class User < ActiveRecord::Base
  has_many :my_bookmarklets, :class_name => "Bookmarklet", :foreign_key => "author_id"

  has_many :bookmarklet_usages
  has_many :bookmarklets, :through => :bookmarklet_usages

  validates_presence_of :name, :identity_url
  validates_uniqueness_of :name, :identity_url, :on => :create
end
