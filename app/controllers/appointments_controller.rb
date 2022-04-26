class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    # for the admin it will show all the appointments
    if Current.user.role == "admin"
      @appointments = Appointment.all
    #for the tutor only the clases from that tutor will show
    elsif Current.user.role == "tutor"
      @appointments = Appointment.where(tutor_id: Current.user.userid)
    #only empty clases or clases where the user is not on them
    else
      @appointments = Appointment.where(number_students: 0).or(Appointment.where.not(:student1 => Current.user.userid, :student2 => Current.user.userid, :student3 => Current.user.userid, :student4 => Current.user.userid, :student5 => Current.user.userid))
    end 
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  def join
    @appointment = Appointment.find(params[:id])
    case @appointment.number_students
    when 0
      @appointment.update(student1: Current.user.userid, number_students: 1)
    when 1
      @appointment.update(student2: Current.user.userid, number_students: 2)
    when 2
      @appointment.update(student3: Current.user.userid, number_students: 3)
    when 3
      @appointment.update(student4: Current.user.userid, number_students: 4)
    when 4
      @appointment.update(student5: Current.user.userid, number_students: 5)
    else
      flash[:alert] = "Error at joining the class"
    end
    flash[:alert] = "Successfully joined the appointment"
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:start_time, :tutor_id, :student1, :student2, :student3, :student4, :student5, :faculty, :professor_id, :number_students)
    end
end
