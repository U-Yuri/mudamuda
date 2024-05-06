class AdminController < ApplicationController
  def admin
    @news = News.all

    if current_user.admin == true

      render "admin"
    else
      render file: "#{Rails.root}/public/404.html", status: 404
    end

  end

  def create
    news = News.create!(
      title: params[:title],
      message: params[:message] 
    )

    redirect_to "/admin"
  end

  def delete
    @news = News.find(params[:id])
    @news.destroy
    redirect_to "/admin"
  end

  def show
    @news = News.find(params[:id])

    render "admin/show"
  end

end
