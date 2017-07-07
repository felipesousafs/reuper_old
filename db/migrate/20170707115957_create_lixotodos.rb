class CreateLixotodos < ActiveRecord::Migration[5.0]
  def change
    create_table :lixotodos do |t|
      t.integer :residente_id
      t.date :data

      t.timestamps
    end
  end
end
