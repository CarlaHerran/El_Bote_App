class RecordsController < ApplicationController
	def exes
		p "EXES" * 20
		p @exes = Record.all
		 @products = Product.all

	end

	def new
		p "NEW" * 50
		@record = Record.new
		@categories = Category.all

	end

	def create
	  p "C" * 20
	  p "create"	  
	  # "calendar"=>{"fecha(1i)"=>"2017", "fecha(2i)"=>"10", "fecha(3i)"=>"21"}, 
	  # "category"=>{"product_id"=>"1"}, 
	  # "record"=>{"account"=>"amount", 
	  # 			"note"=>"note"}, 
	  # "commit"=>"Save", 
	  # "controller"=>"records", 
	  # "action"=>"create"

	  # Aquí el error me marcaba NoMethodError in RecordsController#create undefined method 'id' for nil:NilClass.
	  # Lo que hice fue cambiar:
	  # boat = current_user.boats
	  # boat_id = boat[0].id
	  # Por las siguientes dos líneas de abajo, siendo que como ahorita solo existe un boat (1), no es necesario buscar el boat del current_user, porque todos tienen el mismo. 
	  boat = Boat.find(1)
	  boat_id = boat.id
	  # <%=date_select(:calendar, :fecha)%> Los Params buscan dentro de calendar cada una de las variables de fecha (año, mes y día), representados en el formato de string "fecha(1i)"etc.
	  product = params[:category][:product_id]
	  if product == ""
	  	p "-" * 50
	  	flash[:danger] = "Por favor escoge un producto"
	  	redirect_to new_record_path
	  else 
	   año = params[:calendar]["fecha(1i)"]
	   mes = params[:calendar]["fecha(2i)"]
	   dia = params[:calendar]["fecha(3i)"]
	  # Aquí es necesario buscar products en donde están: en categories.  
	  gasto = params[:record][:account]
	  if gasto == ""
	  	gasto = 0.0
	  end
	  note = params[:record][:note]

	  p product
	  p @record = Record.create!(user_id: current_user.id, boat_id: boat_id, product_id: product, fecha: Time.gm(año, mes, dia), account: gasto, note: note)
	  
	  p current_user
	  p params
	  
	  redirect_to records_path
	  end

	end


	def edit
		p "Edit" * 50
         @record = Record.find(params[:record_id])
        # Hacía falta definir @categories en este método, ya que de otra forma no lo reconocía desde el group_select de la vista edit.
         @categories = Category.all
    end

    def update
    	  "UP" * 50
         @record = Record.find(params[:record_id])

        año = params[:calendar]["fecha(1i)"]
		mes = params[:calendar]["fecha(2i)"]
		dia = params[:calendar]["fecha(3i)"]
		# Actualizo la fecha antes de utilizar el método private de record_params, porque no encontré el formato datetime de "fecha".   
        @record.update(fecha: Time.gm(año, mes, dia), product_id: params[:category][:product_id])
        # p "XXXXX" *50
        # p params
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