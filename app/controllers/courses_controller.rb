class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /courses/1
  # GET /courses/1.json
  def show
    @students = @course.students
    respond_to do |format|
      format.html
      format.csv { send_data @students.to_csv, filename: "#{@course.name}-#{@course.section}-#{@course.semester}.csv" }
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @admin = Admin.find(params[:admin_id])
    @course = @admin.courses.build(course_params)

    respond_to do |format|
      if @course.save
        flash[:success] = 'Course was successfully created.'
        format.html { redirect_to current_admin}
        format.json { render :show, status: :created, location: @course }
      else
        flash[:danger] = 'Course already exists.'
        format.html { redirect_to new_admin_course_path(@course, admin_id: current_admin.id)}
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        flash[:success] = 'Course was successfully updated.'
        format.html { redirect_to admin_course_path}
        format.json { render :show, status: :ok, location: send(@course) }
      else
        flash[:danger] = 'Course already exists.'
        format.html { redirect_to edit_admin_course_path(@course, admin_id: current_admin.id) }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      flash[:success] = "Course was successfully destroyed."
      format.html { redirect_to admin_url(current_admin.id)}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.fetch(:course, {}).permit(:name, :semester, :section, :year)
    end
end
