class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_root_page

  def get_root_page
    if params['path']
      @params = params['path'].split('/')[0]
      @root_page = Refinery::Page.find_by_slug(params['path'].split('/')[0])
    else
      @root_page = Refinery::Page.find_by_id(1)
    end
  end
end
