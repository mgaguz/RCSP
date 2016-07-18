class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.date :fecha
      t.string :nombre
      t.string :sexo
      t.integer :edad
      t.string :ocupacion
      t.string :estado_civil
      t.text :descripcion_del_paciente
      t.text :anamnesis
      t.time :hora_de_inicio
      t.text :desarrollo_de_la_sesion
      t.time :hora_de_termino
      t.text :comentarios

      t.timestamps null: false
    end
  end
end
