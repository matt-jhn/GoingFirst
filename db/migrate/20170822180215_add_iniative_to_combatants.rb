class AddIniativeToCombatants < ActiveRecord::Migration[5.1]
  def change
    add_column :combatants, :initiative, :integer
  end
end
