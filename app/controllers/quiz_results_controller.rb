class QuizResultsController < ApplicationController
  before_action :set_quiz_result, only: [:show, :edit, :update, :destroy]
  include QuizResultsHelper

  # GET /quiz_results/1
  # GET /quiz_results/1.json
  def show
  end

  # GET /quiz_results/new
  def new
    @quiz_result = QuizResult.new
  end

  # GET /quiz_results/1/edit
  def edit
  end

  # POST /quiz_results
  # POST /quiz_results.json
  def create
    @student = Student.find_by(student_id: params[:student_id])
    @quiz_result = @student.quiz_results.build
    @quiz_result.student_id = @student.student_id
    
    (1..18).each do |q|
      answer_params = {"question" => q, "quiz_result_id" => @quiz_result.id, "responseA" => params["q#{q}a1"], "responseB" => params["q#{q}a2"], "responseC" => params["q#{q}a3"], "responseD" => params["q#{q}a4"]}
      @answer = @quiz_result.answers.build(answer_params)
      @answer.save
    end
    
    categories = calculate_score(@quiz_result)
    @quiz_result.collaborator = categories["Collaborator"]
    @quiz_result.communicator = categories["Communicator"]
    @quiz_result.challenger = categories["Challenger"]
    @quiz_result.contributor = categories["Contributer"]
    
    respond_to do |format|
      if @quiz_result.save
        category = categories.key(categories.values.max)
        if @student.category != category
          @student.category = category
          @student.save!
        end
        flash[:success] = 'Quiz was successfully submitted.'
        format.html { redirect_to @student }
        format.json { render :show, status: :created, location: @quiz_result }
      else
        format.html { render :new }
        format.json { render json: @quiz_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_results/1
  # PATCH/PUT /quiz_results/1.json
  def update
    respond_to do |format|
      if @quiz_result.update(quiz_result_params)
        flash[:success] = 'Reflection was successfully updated.'
        format.html { redirect_to @quiz_result.student }
        format.json { render :show, status: :ok, location: send(@quiz_result) }
      else
        format.html { render :edit }
        format.json { render json: @quiz_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_results/1
  # DELETE /quiz_results/1.json
  def destroy
    @quiz_result.destroy
    respond_to do |format|
      flash[:success] = "Quiz result was successfully destroyed."
      format.html { redirect_to quiz_results_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_result
      @quiz_result = QuizResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_result_params
      params.fetch(:quiz_result, {}).permit(:reflection)
    end
end
