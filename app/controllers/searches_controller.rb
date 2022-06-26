class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
  end

  def search_result
    @user = User.find_by(email: params[:search_email])
  end
end
