class CreatePeriodos < ActiveRecord::Migration[5.0]
  def change
    create_table :periodos do |t|
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
