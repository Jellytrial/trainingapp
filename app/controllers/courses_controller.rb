# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy course_restore]
  include CoursesHelper

  # GET /courses
  # GET /courses.json
  def index
    # @courses = Course.all
    @courses = Course.paginate(page: params[:page], per_page: 15).order(sort_column + ' ' + sort_direction)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show; end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit; end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.discard
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def course_restore
    @course = Course.with_discarded.discarded.find(params[:id]).undiscard
    redirect_to courses_path
  end

  def discarded
    @courses = Course.with_discarded.discarded
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.with_discarded.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:course_id, :course_title, :topic, :day_length, :price, :level_id, :category)
  end
end
