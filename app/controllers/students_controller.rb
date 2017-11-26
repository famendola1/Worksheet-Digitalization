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
          flash[:danger] = "ERROR: Please enter an id."
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
       flash[:danger] = "ERROR: " + e.to_s + ". Please try again."
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
    enrollment_created = false
    @course = Course.find(params[:course_id])
    if !Student.exists?(:student_id => student_params[:student_id])
      @student = Student.create( student_params ) 
      @course.enrollments.create( :student_id => @student.student_id )
      enrollment_created = true
    elsif check_id_and_name(student_params)
       flash[:danger] = get_name_error_message(student_params)
    else
      @student = Student.find_by(student_params)
      @course.enrollments.create( :student_id => @student.student_id )
      enrollment_created = true
    end

    respond_to do |format|
      if @course.save and enrollment_created
        flash[:success] = 'Student was successfully added to course.'
        format.html { redirect_to admin_course_path(@course, admin_id: @course.admin_id)}
        format.json { render :show, status: :created, location: @student }
      elsif !enrollment_created
        format.html {redirect_to new_admin_course_student_path(@student, course_id: @course.id, admin_id: current_admin.id)  }
      else
        flash[:danger] = 'Student was not added to course. Student id or name already exists.'
        format.html { redirect_to admin_course_path(@course, admin_id: @course.admin_id)}
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        flash[:success] = 'Student was successfully updated.'
        format.html { redirect_to @student }
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
      flash[:success] = 'Student was successfully destroyed.'
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
  
  def import
    @course = Course.find(params[:course_id])
    if Student.import(params[:file], @course) == 1
      flash[:success] = 'Successfully imported students'
    else
      flash[:danger] = "Error occured during import. Please check your CSV file."
    end
    redirect_to admin_course_path(@course.id, admin_id: current_admin.id)
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
