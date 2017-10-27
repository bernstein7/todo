class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :xeditable?

  def xeditable? object = nil
    true
  end
end
