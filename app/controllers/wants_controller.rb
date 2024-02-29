class WantsController < ApplicationController
  def my_page
    if user_signed_in?
      render "wants/my_page"
    else
      redirect_to "/users/sign_in"
    end

    @wants = Want.all
  end

  def new
    render "new"
    @wants = Want.new
  end
end
