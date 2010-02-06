class HomeController < ApplicationController
  layout "default"

  before_filter :login_required

  def index
    @bookmarklets = current_user.bookmarklets

    js_url = url_for(:controller => 'summon', :only_path => false)
    @master_bookmarklet = remove_spaces(<<-"EOD")
      javascript:
      void(document.body.appendChild(document.createElement('script')).src=
        '#{js_url}');
    EOD
  end

  private

  def remove_spaces(js)
    js.gsub(/^\s+/, "").   #remove spaces on line start
       gsub(/\s*\n/, "")   #remove spaces on line end
  end
end
