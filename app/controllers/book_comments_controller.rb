class BookCommentsController < ApplicationController
  before_action :baria_user, only:[:destroy]

  def create
    book_comment = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book_comment.id
    comment.save
    redirect_to book_path(book_comment)
  end

  def destroy
    BookComment.find_by(id:params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
  def baria_user
    unless
      BookComment.find_by(id:params[:id]).user == current_user
        redirect_to book_path(params[:book_id])
    end
  end

end
