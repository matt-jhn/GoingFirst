class CombatantsController < ApplicationController

	def index
		@combatants = Combatant.all
	end
	
	def new
		@combatant = Combatant.new
	end

	def create
		@combatant = Combatant.new(combatant_params)
		if @combatant.save
			redirect_to '/combatants'
		else
			render 'new'
		end
	end

	private def combatant_params
		params.require(:combatant).permit(:name, :alignment, :initiative, :turn)
	end

end
