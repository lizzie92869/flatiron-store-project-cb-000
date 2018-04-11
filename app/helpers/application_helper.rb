module ApplicationHelper

    def create_current_cart
    	new_cart = carts.create
    	self.current_cart_id = new_cart.id 
    end  

    def number_to_currency(n)
    	"$#{n.to_f/100}"
  	end

  	def after_sign_out_path_for(resource)
    	store_path
	end
    
end
