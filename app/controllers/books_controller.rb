class BooksController<ApplicationController
  def index
    # @author = Author.find(params[:author_id])
    # @books=@author.books
    @books=Book.all
  end
  def show
    @book = B'.ook.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
  @book = Book.new(book_params)
  Rails.logger.debug "BOOK PARAMS: #{book_params.inspect}"
  if @book.save
    redirect_to @book, notice: "Book created successfully!"
  else
     Rails.logger.debug "BOOK NOT SAVED: #{@book.errors.full_messages}"
    render :new, status: :unprocessable_entity
  end
  end
  def edit
  @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to @book, notice: "Book updated successfully!"
  else
    render :edit, status: :unprocessable_entity
  end
  end
  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to books_path, notice: "Book deleted successfully!"
  end
  def preview
    render plain: "Previewing book #{params[:id]}"
  end

  def search
    render plain: "Searching books"
  end



private

def book_params
  params.require(:book).permit(
    :title,
    :year_published,
    :isbn,
    :price,
    :out_of_print,
    :views,
    :supplier_id,
    :author_id
  )
end
end
