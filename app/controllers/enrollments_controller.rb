class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :destroy]

  def index
    @enrollments = Enrollment.all
    render json: @enrollments
  end

  def show
    render json: @enrollment
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      render json: @enrollment, status: :created
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @enrollment.destroy
    head :no_content
  end

  private

  def set_enrollment
    @enrollment = Enrollment.find([params[:student_id], params[:course_id]])
  end

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id, :grade)
  end
end
