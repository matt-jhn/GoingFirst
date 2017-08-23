class AddTurnIdToCombatants < ActiveRecord::Migration[5.1]
  def change
    add_column :combatants, :turn_id, :integer
  end
end
