class SectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update destroy subs]

  def index
    @sections = Section.all_parents
  end

  def show; end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new section_params

    if @section.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @section.update section_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def subs
    @sub_sections = @section.sub_sections
  end

  private

  def set_section
    @section = Section.find params[:id]
  end

  def section_params
    params.require(:section).permit(:name)
  end
end
