class CombatantsController < ApplicationController

	def index
		@combatants = Combatant.all
	end
	
end
