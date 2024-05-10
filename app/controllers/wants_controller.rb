class WantsController < ApplicationController
  def my_page
    @categories = Category.all
    
    # if params["順番"] == "古い"
    #   @wants = Want.where(user_id: current_user.id).order(created_at: :asc)
    # else
    #   @wants = Want.where(user_id: current_user.id).order(created_at: :desc)
    # end
    if params[:category].present?
      @wants = Want.where(user_id: current_user.id, category_id: params[:category]) 
    else
      @wants = Want.where(user_id: current_user.id)
    end
    
    if params["順番"] == "古い"
      @wants = @wants.order(created_at: :asc)
    else
      @wants = @wants.order(created_at: :desc)
    end

    sum = 0
    @wants.each do |want|
      sum += want.money
    end
    @sum = sum

    if user_signed_in?
      render "wants/my_page"
    else
      redirect_to "/users/sign_in"
    end

  end

  def new
    @wants = Want.where(user_id: current_user.id)
    sum = 0
    @wants.each do |want|
      sum += want.money
    end
    @sum = sum

    @categories = Category.all
    render "new"

  end

  def create
    want = Want.create!(
      name: params[:name],
      money: params[:money],
      user_id: current_user.id,
      category_id: params[:category]
    )

    want.image.attach(params[:image])

    redirect_to "/wants"
  end

  def show
    @wants = Want.where(user_id: current_user.id)
    sum = 0
    @wants.each do |want|
      sum += want.money
    end
    @sum = sum

    @wants = Want.find(params[:id])
    render "show"
  end

  def delete
    @wants = Want.find(params[:id])
    @wants.destroy
    redirect_to "/wants"
  end

  def edit
    @wants = Want.where(user_id: current_user.id)
    sum = 0
    @wants.each do |want|
      sum += want.money
    end
    @sum = sum

    @categories = Category.all
    @wants = Want.find(params[:id])
    render "edit"
  end

  def update
    @wants = Want.find(params[:id])
    @wants.update(want_params)
    redirect_to "/wants"
  end

  def message
    @messages = News.all
    render "message"
  end

  def message_show
    @message = News.find(params[:news_id])

    already_clicked = Click.find_by(news_id: params[:news_id], user_id: current_user.id)
    
    if already_clicked.nil?
      Click.create!(
        clicked: params[:created],
        user_id: current_user.id,
        news_id: params[:news_id]
      )
    end
    

    render "message_show"
  end

  private

  def want_params
    params.require(:want).permit(:name, :money, :category_id, :image)
  end
end
