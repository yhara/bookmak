class SummonController < ApplicationController
  #before_filter :login_required, :except => [:index, :list]

  # GET /summon
  #
  # Returns javascript code to open list window.
  def index
    respond_to do |format|
      format.js {} # render summon/index.js.erb
    end
  end

  # GET /summon/list?callback=...
  #
  # Returns html data by jsonp.
  # If user is logging in, returns list of bookmarklets.
  # If user is not logging in, returns login form.
  def list
    if logged_in?
      @bookmarklets = current_user.bookmarklets
      page = "list"
    else
      page = "login"
    end

    html = render_to_string(:action => page)
    data = html_to_string_literal(html)

    funcname = params[:callback]

    render :text => "#{funcname}(#{data});"
  end

  # GET /summon/login?...
  # params: 
  #   user: user name
  #   pass: password
  #   remember: whether to remember
  #   callback: jsonp function name
  # 
  # Login from bookmak window.
  # Returns whether login is succeeded (true/false).
  def login
   # render :controller => 'sessions', :action => 'create_from_summon'
  end

  private

  def html_to_string_literal(html)
    "'" + html.gsub(/\\/){ "\\\\" }.
               gsub(/"/){ '\\"' }.
               gsub(/'/){ "\\\'" }.
               gsub(/\r?\n/, "\\n") + "'"
  end
end
