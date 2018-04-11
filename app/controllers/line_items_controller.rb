class LineItemsController < ApplicationController

	def create
      if current_user.current_cart
        # binding.pry
         current_user.current_cart.add_item(params[:item_id])
      else
        current_user.current_cart = current_user.carts.create
        current_user.save
        current_user.current_cart.add_item(params[:item_id])

      end
    current_user.current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end
	
end
