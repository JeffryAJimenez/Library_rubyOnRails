class CommentsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @comment = @book.comments
  end

  def create
    @book	=	Book.find(params[:book_id])
    @book.comments.create(params.require(:comment).permit(:commenter,	:body))
    @books = Book.all
    redirect_to '/patron/books'
  end

  def index
    @book = Book.find(params[:book_id])
  end
end
