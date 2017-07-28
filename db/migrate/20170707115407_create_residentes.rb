class CreateResidentes < ActiveRecord::Migration[5.0]
  def change
    create_table :residentes do |t|
      t.string :matricula
      t.string :nome
      t.references :curso, foreign_key: true
      t.references :quarto_id, foreign_key: true

      t.timestamps
    end
    add_index :residentes, :matricula

  end
end
