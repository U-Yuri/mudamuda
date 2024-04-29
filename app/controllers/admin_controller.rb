class AdminController < ApplicationController
  def admin
    if current_user.admin == true

      render "admin"
    else
      render file: "#{Rails.root}/public/404.html", status: 404
    end

  end
end
