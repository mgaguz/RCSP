class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /patients
  # GET /patients.json
  def index
    human = current_user.humen.find(params[:human_id])
    @patients = human.patients
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @human = current_user.humen.find(params[:human_id])
  end

  # GET /patients/new
  def new
    @human = current_user.humen.find(params[:human_id])
    human = current_user.humen.find(params[:human_id])
    @patient = human.patients.new
    @tags = Tag.all
  end

  # GET /patients/1/edit
  def edit
    @tags = Tag.all
    @human = current_user.humen.find(params[:human_id])
  end

  # POST /patients
  # POST /patients.json
  def create
    human = current_user.humen.find(params[:human_id])
    @patient = human.patients.new(patient_params)
    @patient.nombre = human.nombre
    @patient.ocupacion = human.ocupacion
    @patient.sexo = human.sexo
    @patient.edad = human.edad
    @patient.estado_civil = human.estado_civil    

    respond_to do |format|
      if @patient.save
        format.html { redirect_to  ([@patient.human, @patient]), notice: 'La Ficha de Atencion ha sido creada.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update

    human = current_user.humen.find(params[:human_id])
    @patient = human.patients.find(params[:id])
    @patient.nombre = human.nombre
    @patient.ocupacion = human.ocupacion
    @patient.sexo = human.sexo
    @patient.edad = human.edad
    @patient.estado_civil = human.estado_civil

    respond_to do |format|

      if @patient.update(patient_params)
        format.html { redirect_to [@patient.human,@patient], notice: 'La Ficha de Atencion ha sido actualizada.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    human = current_user.humen.find(params[:human_id])

    @patient = human.patient.new(patient_params)

    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'La Ficha de Atencion ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      human = current_user.humen.find(params[:human_id])
      @patient = human.patients.find(params[:id])
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:fecha, :nombre, :sexo, :edad, :ocupacion, :estado_civil, :descripcion_del_paciente, :anamnesis, :hora_de_inicio, :desarrollo_de_la_sesion, :hora_de_termino, :comentarios, :tag_ids => [])
    end
end
