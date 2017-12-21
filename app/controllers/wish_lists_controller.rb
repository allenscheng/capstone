class WishListsController < ApplicationController
  def index
    list = WishList.all.order(:id => :asc)
    render json: list.as_json 
  end
  def create
    list = WishList.new( 
      user_id: current_user.id,
      product_link: params[:product_link]
      )
    if list.save  
      render json: {status: "Successfully created a new wishlist  item!"}
    else 
      render json: {errors: list.errors.full_messages}, staus: :bad_request
    end
  end
  def show
    list = WishList.find_by(:id, params[:id])
    render json: list.as_json 
  end
  def update
    list = WishList.find_by(:id, params[:id])
    list.product_link = params[:product_link] || list.product_link
  end
  def destroy
    list = WishList.find_by(:id, params[:id]) 
    list.destroy
    render json: {message: "Wishlist item has been removed!"}    
  end
end
