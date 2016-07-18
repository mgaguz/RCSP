json.array!(@patients) do |patient|
  json.extract! patient, :id, :fecha, :nombre, :sexo, :edad, :ocupacion, :estado_civil, :descripcion_del_paciente, :anamnesis, :hora_de_inicio, :desarrollo_de_la_sesion, :hora_de_termino, :comentarios
  json.url patient_url(patient, format: :json)
end
