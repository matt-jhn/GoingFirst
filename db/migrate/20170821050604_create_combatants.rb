class CreateCombatants < ActiveRecord::Migration[5.1]
  def change

    create_table :combatants do |t|

    t.string :name
    t.string :alignment

    end
  end
end
