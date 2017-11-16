class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :destroy]
  include StudentsHelper
  
  # GET /students
  # GET /students.json
  def index
    if params[:student]
        begin
          redirect_to student_path(params[:student][:id])
        rescue ActionController::UrlGenerationError => e
          flash[:error] = "ERROR: Please enter an id."
          redirect_to students_path
        end
    end 
  end

  # GET /students/1
  # GET /students/1.json
  def show
    begin
      set_student
    
    rescue ActiveRecord::RecordNotFound => e
       flash[:error] = "ERROR: " + e.to_s + ". Please try again."
       redirect_to students_path

    end    
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @course = Course.find(params[:course_id])
    if !Student.exists?(student_params)
      @student = Student.create( student_params ) 
    else
      @student = Student.find_by(student_params)
    end
    @course.enrollments.create( :student_id => @student.student_id )

    respond_to do |format|
      if @course.save #@course.enrollments.find_by(:student_id => @student.student_id).save
        format.html { redirect_to admin_course_path(@course, admin_id: @course.admin_id), notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { redirect_to admin_course_path(@course, admin_id: @course.admin_id), notice: 'Student was not added. Enrollment already exists.' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    @course = Course.find(params[:course_id])
    Student.import(params[:file], @course)
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.fetch(:student, {}).permit(:student_id, :name)
    end
end
