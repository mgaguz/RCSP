json.array!(@humen) do |human|
  json.extract! human, :id, :nombre, :sexo, :edad, :ocupacion, :estado_civil, :descripcion_del_paciente, :comentarios
  json.url human_url(human, format: :json)
end
