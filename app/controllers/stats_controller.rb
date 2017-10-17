class StatsController < ApplicationController
	def show_stats
		p "Entramos al método show_stats" * 50
	  # Aquí el error me marcaba NoMethodError in StatsController#create undefined method 'id' for nil:NilClass.
	  # Lo que hice fue cambiar:
	  # boat = current_user.boats
	  # boat_ide = boat[0].id
	  # Por las siguientes dos líneas de abajo, siendo que como ahorita solo existe un boat (1), no es necesario buscar el boat del current_user, porque todos tienen el mismo. 
		boat = Boat.find(1)
	  	boat_id = boat.id
		meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
	    @stat = []
		meses.each do |mes|
	      value = Record.where(boat_id: boat_id).where(mes: mes).sum(:account)
	      @stat << [mes, value]
		end
		p @stat
	end


	




end	