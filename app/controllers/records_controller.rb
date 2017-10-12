class RecordsController < ApplicationController
	def exes
		p "Entramos al método" * 20
		@exes = Record.all
		@products = Product.all
	end

	def new
		p "Entramos al new record" * 20
		@record = Record.new
	end

	def create
	  p "Método create de records controller" * 20
	  boat = current_user.boats
	  boat_id = boat[0].id
	  mes = params[:record][:mes]
	  product = params[:record][:product_id]
	  gasto = params[:record][:account]
	  @record = Record.create(boat_id: boat_id, product_id: product, mes: mes, account: gasto)
	  redirect_to records_path
	end


	def edit
		p "Entrando a edit!" * 50
        p @record = Record.find(params[:record_id])
        # redirect_to edit_path
    end

    def update
        @record = Record.find(params[:record_id])
        # if @record.update(record_params)
        #      redirect_to records_path
        # else
        #     render 'edit'
        # end

    end



end	