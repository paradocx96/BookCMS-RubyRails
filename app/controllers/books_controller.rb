class BooksController < ApplicationController
  # User Authentication Check
  before_action :require_auth

  # Set Book Values for operations
  before_action :set_book, only: %i[ show edit update destroy ]

  # Book Catalog View Load
  def index
    begin
      # Initialize books variable with All books from database
      @books = Book.all
    rescue => e
      # Logging errors when getting all books
      logger.error("Book Catalog Error: #{e.message}")
    end
  end

  # Book Create View Load
  def new
    # Initialize book object for creation
    @book = Book.new
  end

  # Book by Id View Load
  def show
  end

  # Book Update by Id View Load
  def edit
  end

  ##
  # Book Create Method
  # POST method for creating new book using book model params
  def create
    # Initialized book object with params data
    @book = Book.new(book_params)

    begin
      # Save book in database
      if @book.save
        # If book saved in database redirect to book view & notify book creation
        redirect_to book_url(@book), notice: "Book was successfully created."
      else
        # If book could not saved in database render same view and notify errors
        render :new, status: :unprocessable_entity
      end
    rescue => e
      # Logging errors when book creation
      logger.error("Book Creation Error: #{e.message}")
    end
  end

  ##
  # Book Update Method
  # PATCH method for update book using book model params
  def update
    begin
      # Update book in database
      if @book.update(book_params)
        # If book successfully updated redirect to book view & notify book update
        redirect_to book_url(@book), notice: "Book was successfully updated."
      else
        # If book could not updated in database render same view and notify errors
        render :edit, status: :unprocessable_entity
      end
    rescue => e
      # Logging errors when book update
      logger.error("Book Update Error: #{e.message}")
    end
  end

  ##
  # Book Remove Method
  # DELETE method for remove book from database using book id
  def destroy
    begin
      # Remove book in database
      if @book.destroy
        # Redirect to Catalog View & notify book removal
        redirect_to books_url, notice: "Book was successfully removed."
      else
        # If book could not removed in database render same view and notify errors
        render :show, status: :unprocessable_entity
      end
    rescue => e
      # Logging errors when book remove
      logger.error("Book Remove Error: #{e.message}")
    end
  end

  private

  ##
  # Book Params Method
  # Set params for securely process the books
  def book_params
    params.require(:book).permit(:title, :author, :genre, :publication_year)
  end

  ##
  # Set Book Method
  # Initialized book object finding book using params id
  def set_book
    begin
      @book = Book.find(params[:id])
    rescue => e
      # Logging errors when book find
      logger.error("Book Find Error: #{e.message}")
    end
  end
end
