class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    render
  end
end
