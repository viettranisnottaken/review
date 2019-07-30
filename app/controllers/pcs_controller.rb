class PcsController < ApplicationController
  def index
    @pcs = Pc.paginate(page: params[:page], per_page: 15)
  end

  def show
  end
end
