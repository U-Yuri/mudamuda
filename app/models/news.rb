class News < ApplicationRecord
  has_many :clicks
  def current_user_clicked(current_user)
    Click.find_by(news_id: id, user_id: current_user.id)
  end

end
