class CreateResidentes < ActiveRecord::Migration[5.0]
  def change
    create_table :residentes do |t|
      t.string :matricula
      t.string :nome
      t.integer :curso_id
      t.integer :quarto_id

      t.timestamps
    end
    add_index :residentes, :matricula

  end
end
