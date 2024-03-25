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
    @categories = Category.all
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
    params.require(:want).permit(:name, :money, :category_id)
  end
end
