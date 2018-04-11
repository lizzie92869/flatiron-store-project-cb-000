class CartsController < ApplicationController

	def show
		@cart = Cart.find(params[:id])
	end

	def checkout
		@cart = Cart.find(params[:id])
		@cart.checkout
		
		@cart.user.empty_cart
		redirect_to cart_path(@cart)
	end


end
