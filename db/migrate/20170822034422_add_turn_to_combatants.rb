class AddTurnToCombatants < ActiveRecord::Migration[5.1]
  def change
    add_column :combatants, :turn, :boolean
  end
end
