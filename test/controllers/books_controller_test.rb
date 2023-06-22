require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  # Setup sample data as book object
  setup do
    @book_one = books(:one)
    @book_two = books(:two)
  end

  # Test whether Book catalog view load
  test "should view book catalog page" do
    get books_url

    # Assert Check response is success
    assert_response :success
  end

  # Test whether Book creation view load
  test "should view book creation page" do
    get new_book_url

    # Assert Check response is success
    assert_response :success
  end

  # Test whether book creation process
  test "should create a book" do
    # Check Book count on creation
    assert_difference("Book.count") do

      # Create a book with sample book data
      post books_url, params: { book: { title: @book_one.title, author: @book_one.author, genre: @book_one.genre, publication_year: @book_one.publication_year } }
    end

    # Check redirection when book creation done
    assert_redirected_to book_url(Book.last)
  end

  # Test whether created sample book view
  test "should view the book" do
    get book_url(@book_one)

    # Assert Check response is success
    assert_response :success
  end

  # Test whether book update view load
  test "should view book update page" do
    get edit_book_url(@book_one)

    # Assert Check response is success
    assert_response :success
  end

  # Test whether book update process
  test "should update book" do
    # Update the book with sample data
    patch book_url(@book_one), params: { book: { title: @book_two.title, author: @book_two.author, genre: @book_two.genre, publication_year: @book_two.publication_year } }

    # Check redirection when book update done
    assert_redirected_to book_url(@book_one)
  end

  # Test whether book remove process
  test "should remove the book" do
    # Check Book count on remove
    assert_difference("Book.count", -1) do

      # Remove the book
      delete book_url(@book_one)
    end

    # Check redirection when book remove done
    assert_redirected_to books_url
  end
end
