class LaptopsController < ApplicationController
  def index
    @laptops = Laptop.paginate(page: params[:id], per_page: 15)
  end

  def show
  end
end
