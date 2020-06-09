class SearchController < ApplicationController
  before_action :set_teacher, only: [:index, :show, :create]

  def index
      if params[:query].present?
     user = User.search(params[:query])
   else
     @user = User.all
   end
    end
end
