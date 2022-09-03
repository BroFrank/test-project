class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_section, only: %i[index new edit create update destroy]

  def index
    @books = @section.get_books
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = @section.books.build section_params

    if @book.save
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
    if @book.update section_params
      redirect_to section_books_path(@section)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to section_books_path(@section) }
      format.turbo_stream
    end
  end

  private

  def set_section
    @section = Section.find params[:section_id]
  end

  def set_book
    @book = Section.find(params[:section_id]).books.find params[:id]
  end

  def section_params
    params.require(:book).permit(:name)
  end
end
