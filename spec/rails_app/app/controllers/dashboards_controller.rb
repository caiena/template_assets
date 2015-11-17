class DashboardsController < ApplicationController
  before_filter :check_failure, only: :show
  def index; end

  def show; end


  private

  def check_failure
    redirect_to action: :index if params[:failure]
  end
end
