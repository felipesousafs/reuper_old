class CreateResidentes < ActiveRecord::Migration[5.0]
  def change
    create_table :residentes do |t|
      t.string :matricula
      t.string :nome
      t.integer :curso
      t.integer :quarto

      t.timestamps
    end
    add_index :residentes, :matricula
    add_reference :residentes, :quarto, foreign_key: true
    add_reference :residentes, :curso, foreign_key: true

  end
end
