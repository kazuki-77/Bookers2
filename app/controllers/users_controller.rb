class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user)
    @book = Book.new
  end

  def index
     @users = User.all
     @user = current_user
     @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(id: current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user_id
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created'
    else
      render :'books/index'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to user_path(id: current_user), notice: "Book was successfully destroyed"
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
