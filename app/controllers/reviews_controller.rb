class ReviewsController < ApplicationController
  before_action :set_book, only: [:index, :new, :create]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = @book.reviews
  end

  def show
  end

  def new
    @review = @book.reviews.build
  end

  def create
    @review = @book.reviews.build(review_params)
    if @review.save
      redirect_to @review, notice: "Review created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: "Review updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to book_reviews_path(@review.book), notice: "Review deleted."
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
