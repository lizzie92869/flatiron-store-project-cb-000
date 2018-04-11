class Cart < ActiveRecord::Base
	belongs_to :user	
	has_many :line_items
	has_many :items, through: :line_items


	def add_item(item_id)
    	if line_item = self.line_items.find_by(item_id: item_id)
      		line_item.quantity += 1
          line_item.save
    	else
     		line_item=self.line_items.new(item_id: item_id)
    	end
    line_item
  end


	def total
	    total = 0
	    self.line_items.each do |line_item|
	      total += (line_item.item.price * line_item.quantity)
	    end
	    total
  	end

  	def checkout
    	if self.update(status: 'submitted')
        self.line_items.each do |line_item|
     		line_item.item.inventory -= line_item.quantity
      	line_item.item.save
    		end
    	end
    end
  	   
end
