class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
      @book = Book.new(params.require(:book).permit(:title, :author, :ISBN, :copies))
      if @book.save
        redirect_to @book #rederict to show
      else
        render 'new'
      end
  end


  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(params.require(:book).permit(:title, :author, :ISBN, :copies))
        redirect_to @book #rederict to show
      else
        render 'edit'
      end
  end

  def checkout
    @book = Book.find(params[:id])

    if @book.copies < 1
      @book.errors.add(:base, "There are no books to checkout")
    else
      @book.remove_copy
    end

    @books = Book.all
    render 'search'
  end

  def search
    @book = Book.new
    @books = Book.where("#{params[:search_by]} LIKE ?", "%" + params[:q] + "%")
  end

  #######################################PATRON#################################
  def patron_index
    @book = Book.new
    @books = Book.all
  end

  def patron_search
    @book = Book.new
    @books = Book.where("#{params[:search_by]} LIKE ?", "%" + params[:q] + "%")
  end
end
