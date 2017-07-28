class CreateLixodones < ActiveRecord::Migration[5.0]
  def change
    create_table :lixodones do |t|
      t.references :residente, foreign_key: true
      t.date :data

      t.timestamps
    end
  end
end
