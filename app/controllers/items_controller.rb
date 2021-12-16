class ItemsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else
    items = Item.all
    end
    render json: items, include: :user
    
  end

  def show
    
    item = Item.find_by_id(params[:id])
    if item
    render json: item, include: :user
    else
      render json: "item not found", status: :not_found
     
    end
     
   
  end
  def create
    user = User.find(params[:user_id])
    newitem= user.items.create(item_params)
    render json: newitem, status: :created
  end

private

def item_params
params.permit(:name, :description, :price)
  
end
def user_not_found
  render json: { error: "how bout it" }, status: :not_found
end
end