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
    render "new"
    @wants = Want.new
  end

  def wants_params
    params.require(:wants).permit(:name, :money)
  end

  def create
    Want.create!(
      name: params[:name],
      money: params[:money],
      user_id: current_user.id,
      category_id: "1" #まだ登録していないのでとりあえず ”１” を入力している（※のちに変更）
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

end
