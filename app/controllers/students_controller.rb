class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update ]

  def index
    @students = Student.all
  end

  def show
  end

  def edit
  end

  def update
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
end
