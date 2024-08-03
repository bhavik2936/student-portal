class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update ]

  def index
    authorize Student
    @students = Student.all

    policy_scope(@students)

    respond_to do |format|
      format.html
      format.csv { send_data @students.to_csv, filename: "students-#{Date.today}.csv" }
    end
  end

  def import
    return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
    return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

    file = File.open(params[:file])
    CSV.foreach(file, headers: true) do |row|
      student = Student.create(row.to_hash.merge(password: SecureRandom.hex(8), approved: true))
      student.inform_student_registration
    end

    redirect_to request.referer, notice: 'Students imported'
  end

  def show
    authorize @student
  end

  def edit
    authorize @student
  end

  def update
    authorize @student

    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:email, :first_name, :last_name, :address, :date_of_birth, :approved)
    end

    def authorize_student
    end
end
