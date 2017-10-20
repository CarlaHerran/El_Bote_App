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
	  # Aquí el error me marcaba NoMethodError in RecordsController#create undefined method 'id' for nil:NilClass.
	  # Lo que hice fue cambiar:
	  # boat = current_user.boats
	  # boat_ide = boat[0].id
	  # Por las siguientes dos líneas de abajo, siendo que como ahorita solo existe un boat (1), no es necesario buscar el boat del current_user, porque todos tienen el mismo. 
	  boat = Boat.find(1)
	  boat_id = boat.id
	  p "-" * 50
	  p params[:calendar]["fecha(1i)"]
	  p fecha = params[:record][:calendar]
	  product = params[:record][:product_id]
	  gasto = params[:record][:account]
	  note = params[:record][:note]
	  @record = Record.create(boat_id: boat_id, product_id: product, fecha: fecha, account: gasto, note: note)
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
	        params.require(:record).permit([:boat_id, :product_id, :fecha, :account, :note])
	    end


end	