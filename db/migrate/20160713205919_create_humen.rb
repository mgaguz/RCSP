class CreateHumen < ActiveRecord::Migration
  def change
    create_table :humen do |t|
      t.string :nombre
      t.string :sexo
      t.integer :edad
      t.string :ocupacion
      t.string :estado_civil
      t.text :descripcion_del_paciente
      t.text :comentarios

      t.timestamps null: false
    end
  end
end
