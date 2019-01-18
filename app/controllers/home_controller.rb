class HomeController < ApplicationController
  def index
    # @questions = Question.all

    # order by created_at
    @questions = Question.order(created_at: :desc).all
  end

  def about
  end

  def temp
    redirect_to root_path
  end

end
