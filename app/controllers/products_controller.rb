class ProductsController < ApplicationController
	

	def product_options
		p "Entramos al método product_options" * 20
		
	end

	def create
		p "Por fin entramos "*100
		p params

		@category = Category.find_or_create_by(name: params[:category])
		@product = Product.find_or_create_by(name: params[:product]) do |product|
			product.category_id = @category.id
		end
		@categories = Category.all
	end		


end	