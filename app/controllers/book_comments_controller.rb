class BookCommentsController < ApplicationController
  before_action :baria_user, only:[:destroy]

  def create
    @detail_book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @detail_book.id
    comment.save
  end

  def destroy
    book_comment = BookComment.find_by(id:params[:id])
    book_comment.destroy
    @detail_book = Book.find(book_comment.book.id)
    render :create
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def baria_user
    unless
      BookComment.find_by(id:params[:id]).user_id == current_user.id
        redirect_to book_path(params[:book_id])
    end
  end

end
