class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @users = User.all

    # for the admin it will show all the appointments
    if Current.user.role == "admin"
      @appointments = Appointment.all
      @appointments = Appointment.order('start_time DESC')
    #for the tutor only the clases from that tutor will show
    elsif Current.user.role == "tutor"
      @appointments = Appointment.where(tutor_id: Current.user.userid).where("start_time > ?" , DateTime.now).order('start_time DESC')
    #only empty clases or clases where the user is not on them
    else
      @appointments = Appointment.where(number_students: 0).where("start_time > ?" , DateTime.now).or(Appointment.where.not(:student1 => Current.user.userid, :student2 => Current.user.userid, :student3 => Current.user.userid, :student4 => Current.user.userid, :student5 => Current.user.userid)).order('start_time DESC')
    end 
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  def list
    @appointments = Appointment.where("student1 = ? AND start_time > ?", Current.user.userid , DateTime.now).or(Appointment.where("student2 = ? AND start_time > ?", Current.user.userid , DateTime.now)).or(Appointment.where("student3 = ? AND start_time > ?", Current.user.userid , DateTime.now)).or(Appointment.where("student4 = ? AND start_time > ?", Current.user.userid , DateTime.now)).or(Appointment.where("student5 = ? AND start_time > ?", Current.user.userid , DateTime.now))
  end

  def historial
    if Current.user.role == "user"
      @appointments = Appointment.where(:student1 => Current.user.userid).or(Appointment.where(:student2 => Current.user.userid)).or(Appointment.where(:student3 => Current.user.userid)).or(Appointment.where(:student4 => Current.user.userid)).or(Appointment.where(:student5 => Current.user.userid)).order('start_time DESC')
    elsif Current.user.role == "tutor"
      @appointments = Appointment.where(tutor_id: Current.user.userid).order('start_time DESC')
    end

  end

  def calendarlist

    @appointments = Appointment.where( :DATE(start_time) => params[:date])
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

  def remove
    @appointment = Appointment.find(params[:id])
    if Current.user.userid == @appointment.student1

      case @appointment.number_students
      when 1
        @appointment.update(student1: nil , number_students: 0)
      when 2
        @appointment.update(student1: appointment.student2 , student2: nil , number_students: 1)
      when 3
        @appointment.update(student1: appointment.student3 , student3: nil , number_students: 2)
      when 4
        @appointment.update(student1: appointment.student4 , student4: nil , number_students: 3)
      when 5
        @appointment.update(student1: appointment.student5 , student5: nil , number_students: 4)
      end
    elsif Current.user.userid == @appointment.student2
      case @appointment.number_students
      when 2
        @appointment.update(student2: nil , number_students: 1)
      when 3
        @appointment.update(student2: appointment.student3 , student3: nil , number_students: 2)
      when 4
        @appointment.update(student2: appointment.student4 , student4: nil , number_students: 3)
      when 5
        @appointment.update(student2: appointment.student5 , student5: nil , number_students: 4)
      end
    elsif Current.user.userid == @appointment.student3
      case @appointment.number_students
      when 3
        @appointment.update(student3: nil , number_students: 2)
      when 4
        @appointment.update(student3: appointment.student4 , student4: nil , number_students: 3)
      when 5
        @appointment.update(student3: appointment.student5 , student5: nil , number_students: 4)
      end
    elsif Current.user.userid == @appointment.student4
      case @appointment.number_students
      when 4
        @appointment.update(student4: nil , number_students: 3)
      when 5
        @appointment.update(student4: appointment.student5 , student5: nil , number_students: 4)
      end
    else
      @appointment.update(student5: nil , number_students: 4)
    end
    flash[:alert] = "Successfully removed from the appointment"
  end

  # GET /appointments/new
  def new
    @professors = Professor.all
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    #if @appointment.student1.empty?
    #  @appointment.update(student1: nil)
    #end
    #if @appointment.student2.empty?
    #  @appointment.update(student2: nil)
    #end
    #if @appointment.student3.empty?
    #  @appointment.update(student3: nil)
    #end
    #if @appointment.student4.empty?
    #  @appointment.update(student4: nil)
    #end
    #if @appointment.student5.empty?
    #  @appointment.update(student5: nil)
    #end


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
      params.require(:appointment).permit(:start_time, :tutor_id, :student1, :student2, :student3, :student4, :student5, :faculty, :professor_id, :number_students, :topic, :comments)
    end
end
