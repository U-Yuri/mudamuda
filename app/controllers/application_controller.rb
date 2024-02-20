class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    mudamuda_path
  end

  def after_sign_in_path_for(resource)
    mudamuda_path
  end

end
