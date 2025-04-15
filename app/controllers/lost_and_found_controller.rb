class LostAndFoundController < ApplicationController
  # No authentication required for this public action
  def show
    @item = Item.find(params[:id])
  end
end
