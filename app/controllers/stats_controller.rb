class StatsController < ApplicationController
	def show_stats
		p "Entramos al método show_stats" * 50
		boat = current_user.boats
	  	boat_id = boat[0].id
		meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
	    @stat = []
		meses.each do |mes|
	      value = Record.where(boat_id: boat_id).where(mes: mes).sum(:account)
	      @stat << [mes, value]
		end
		p @stat
	end


	




end	