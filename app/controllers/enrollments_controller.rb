class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:destroy]
  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    course_id = @enrollment.course_id
    @enrollment.destroy
    respond_to do |format|
      flash[:success] = "Student was successfully removed."
      format.html { redirect_to admin_course_path(course_id, admin_id: current_admin.id)}
      format.json { head :no_content }
    end
  end
  
  private 
  
  def set_enrollment
      @enrollment = Enrollment.find(params[:id])
  end
end