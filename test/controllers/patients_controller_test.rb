require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { anamnesis: @patient.anamnesis, comentarios: @patient.comentarios, desarrollo_de_la_sesion: @patient.desarrollo_de_la_sesion, descripcion_del_paciente: @patient.descripcion_del_paciente, edad: @patient.edad, estado_civil: @patient.estado_civil, fecha: @patient.fecha, hora_de_inicio: @patient.hora_de_inicio, hora_de_termino: @patient.hora_de_termino, nombre: @patient.nombre, ocupacion: @patient.ocupacion, sexo: @patient.sexo }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { anamnesis: @patient.anamnesis, comentarios: @patient.comentarios, desarrollo_de_la_sesion: @patient.desarrollo_de_la_sesion, descripcion_del_paciente: @patient.descripcion_del_paciente, edad: @patient.edad, estado_civil: @patient.estado_civil, fecha: @patient.fecha, hora_de_inicio: @patient.hora_de_inicio, hora_de_termino: @patient.hora_de_termino, nombre: @patient.nombre, ocupacion: @patient.ocupacion, sexo: @patient.sexo }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
