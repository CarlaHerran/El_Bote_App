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
    end

    def update
    	p "Llegamos a update?" * 50
        p @record = Record.find(params[:record_id])
        p params
        if @record.update(record_params)
        	flash[:success] = "Updated Succesfully"
        	redirect_to records_path
        else
            render 'edit'
        end

    end

    def destroy
    	p "DESTROY" * 50
    	Record.find(params[:record_id]).destroy
    	flash[:success] = "Exe deleted"
    	redirect_to records_path
    end	




	private
	
	    def record_params
	        params.require(:record).permit([:boat_id, :product_id, :mes, :account])
	    end


end	