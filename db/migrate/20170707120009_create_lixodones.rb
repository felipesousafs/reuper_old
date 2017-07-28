class CreateLixodones < ActiveRecord::Migration[5.0]
  def change
    create_table :lixodones do |t|
      t.integer :residente_id
      t.date :data

      t.timestamps
    end
    add_reference :lixodones, :residente, foreign_key: true
  end
end
