class ItemRelationshipsController < ApplicationController
  def create
    # laptop = Laptop.find(params[:laptop_id])
    item_variable(eval(params[:object]), params[:itemtype])
    # laptop.item_relationships.create!(user_id: current_user.id)
    @@ordered_item.item_relationships.create!(user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.json
    end
  end

  def destroy
    # relationship = ItemRelationship.where(id: params[:id])
    # relationship.destroy(id: params[:id])
    ItemRelationship.destroy(params[:id])
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.json
    end
  end

  private

  def item_variable(object, item)
    @@ordered_item = object.find(params["#{item}_id"])
  end
end
