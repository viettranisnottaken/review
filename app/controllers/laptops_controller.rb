class LaptopsController < ApplicationController
  def index
    @laptops = Laptop.paginate(page: params[:page], per_page: 15).order(created_at: :desc)
  end

  def show
  end
end
