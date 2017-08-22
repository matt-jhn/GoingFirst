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

	def destroy
		Combatant.destroy(params[:id])
		redirect_to '/combatants'
	end

	private def combatant_params
		params.require(:combatant).permit(:name, :alignment, :initiative, :turn)
	end

end
