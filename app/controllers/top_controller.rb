class TopController < ApplicationController
  layout "default"

  def index
    @bookmarklets = Bookmarklet.find(:all, :limit => 10)
  end
end
