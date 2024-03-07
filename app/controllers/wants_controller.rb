class WantsController < ApplicationController
  def my_page
    @wants= Want.where(user_id: current_user.id)
    # @wants = Want.all

    if user_signed_in?
      render "wants/my_page"
    else
      redirect_to "/users/sign_in"
    end
  end

  def new
    @categories = Category.all
    render "new"
    @wants = Want.new
   
  end

  def create
    Want.create!(
      name: params[:name],
      money: params[:money],
      user_id: current_user.id,
      category_id: params[:category]
    )

    redirect_to "/wants"
  end

  def show
    @wants = Want.find(params[:id])
    render "show"
  end

  def delete
    @wants = Want.find(params[:id])
    @wants.destroy
    redirect_to "/wants"
  end

  def edit
    @wants = Want.find(params[:id])
    render "edit"
  end

  def update
    @wants = Want.find(params[:id])
    @wants.update(want_params)
    redirect_to "/wants"
  end

  private

  def want_params
    params.require(:want).permit(:name, :money)
  end
end
