class CreateQuartos < ActiveRecord::Migration[5.0]
  def change
    create_table :quartos do |t|
      t.integer :numero
      t.string :piso

      t.timestamps
    end
  end
end
