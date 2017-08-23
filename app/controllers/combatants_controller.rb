class CombatantsController < ApplicationController


	def index
		@combatants = Combatant.all.order(:initiative).reverse
		maxInitId = 0
		maxInit = 0

		@combatants.each_with_index do |combatant, index|
			combatant.update(:turn_id => index)
		end

		@combatants.each do |combatant|
			if combatant.initiative > maxInit
				maxInit = combatant.initiative
				maxInitId = combatant.id
			end
		end

		#hack solution: have user enter highest init first and check box true
		# @combatants.each do |combatant|
		# 	if combatant.id == maxInitId
		# 		combatant.update(:turn => true)
		# 	end
		# end

	end

	def update_turn
		@combatant = Combatant.find(params[:id])
		@turn_id = @combatant.turn_id + 1
		@combatant.update_attribute(:turn, false)

		if Combatant.find_by(turn_id: @turn_id) != nil
			@next_combat = Combatant.find_by(turn_id: @turn_id)
			@next_combat.update_attribute(:turn, true)
			redirect_to '/combatants'
		else
			@turn_id = 0
			@next_combat = Combatant.find_by(turn_id: @turn_id)
			@next_combat.update_attribute(:turn, true)
			redirect_to '/combatants'
		end
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
