class ProductsController < ApplicationController
	def product_options
		p "Entramos al método product_options" * 20
		
	end

	def create
		p "Por fin entramos "*100
		p params

		@category = Category.create(name: params[:category])
		@product = Product.create(name: params[:product], category_id: @category.id)
		@categories = Category.all
	end		



end	