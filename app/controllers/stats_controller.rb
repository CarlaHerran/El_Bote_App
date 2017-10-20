class StatsController < ApplicationController
	def show_stats
		p "-_-" * 50
	  # Aquí el error me marcaba NoMethodError in StatsController#create undefined method 'id' for nil:NilClass.
	  # Lo que hice fue cambiar:
	  # boat = current_user.boats
	  # boat_id = boat[0].id
	  # Por las siguientes dos líneas de abajo, siendo que como ahorita solo existe un boat (1), no es necesario buscar el boat del current_user, porque todos tienen el mismo. 
		boat = Boat.find(1)
	  	boat_id = boat.id
		records = Record.all
	    # @stat = []

	    @enero = 0
	    @febrero = 0
	    @marzo = 0
	    @abril = 0
	    @mayo = 0
	    @junio = 0
	    @julio = 0
	    @agosto = 0
	    @septiembre = 0
	    @octubre = 0
	    @noviembre = 0
	    @diciembre = 0

		records.each do |record|
		 #cada record tiene una fecha 
		 # asignar a "value", el record donde el boat_id es 1, y donde 
	      # value = Record.where(boat_id: boat_id).where(fecha: record.fecha.month).sum(:account)
	      # p "+" * 50
	      # p @stat << [record, value]
	      mes = record.fecha.month

	     p mes
	     case mes
	     	when 1
	     		p "la suma es #{record.account} + #{ @enero} "
		     	@enero += record.account
		     	p "el mes de enero lleva #{ @enero}"
		     	p "+" * 50
	     	when 2
	     		p "la suma es #{record.account} + #{ @febrero} "
	     		@febrero += record.account
		     	p "el mes de febrero lleva #{ @febrero}"
		     	p "+" * 50
		    when 3 
	     		p "la suma es #{record.account} + #{ @marzo} "
	     		@marzo += record.account
		     	p "el mes de marzo lleva #{ @marzo}"
		     	p "+" * 50
		    when 4 
	     		p "la suma es #{record.account} + #{ @abril} "
	     		@abril += record.account
		     	p "el mes de abril lleva #{ @abril}"
		     	p "+" * 50 	
		    when 5 
	     		p "la suma es #{record.account} + #{ @mayo} "
	     		@mayo += record.account
		     	p "el mes de mayo lleva #{ @mayo}"
		     	p "+" * 50 	 	
		    when 6 
	     		p "la suma es #{record.account} + #{ @junio} "
	     		@junio += record.account
		     	p "el mes de junio lleva #{ @junio}"
		     	p "+" * 50 	  	
		    when 7 
	     		p "la suma es #{record.account} + #{ @julio} "
	     		@julio += record.account
		     	p "el mes de julio lleva #{ @julio}"
		     	p "+" * 50 	
		    when 8 
	     		p "la suma es #{record.account} + #{ @agosto} "
	     		@agosto += record.account
		     	p "el mes de agosto lleva #{ @agosto}"
		     	p "+" * 50	
		    when 9 
	     		p "la suma es #{record.account} + #{ @septiembre} "
	     		@septiembre += record.account
		     	p "el mes de septiembre lleva #{ @septiembre}"
		     	p "+" * 50
		    when 10 
	     		p "la suma es #{record.account} + #{ @octubre} "
	     		@octubre += record.account
		     	p "el mes de octubre lleva #{ @octubre}"
		     	p "+" * 50 	 	
		    when 11 
	     		p "la suma es #{record.account} + #{ @noviembre} "
	     		@noviembre += record.account
		     	p "el mes de noviembre lleva #{ @noviembre}"
		     	p "+" * 50  	
		    when 12 
	     		p "la suma es #{record.account} + #{ @diciembre} "
	     		@diciembre += record.account
		     	p "el mes de diciembre lleva #{ @diciembre}"
		     	p "+" * 50 	
	     end 
	     		p mes


		end
		p "*" * 50
	   # p @stat
	end







end	