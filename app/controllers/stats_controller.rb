class StatsController < ApplicationController
	def show_stats
		p "-" * 50
	  # Aquí el error me marcaba NoMethodError in StatsController#create undefined method 'id' for nil:NilClass.
	  # Lo que hice fue cambiar:
	  # boat = current_user.boats
	  # boat_id = boat[0].id
	  # Por las siguientes dos líneas de abajo, siendo que como ahorita solo existe un boat (1), no es necesario buscar el boat del current_user, porque todos tienen el mismo. 
		boat = Boat.find(1)
	  	boat_id = boat.id

		records = Record.all
	    @stat = []
		records.each do |record|
			record.fecha.month
	      value = Record.where(boat_id: boat_id).sum(:account)
	      @stat << [record, value]
		end
		p @stat
	end


	




end	