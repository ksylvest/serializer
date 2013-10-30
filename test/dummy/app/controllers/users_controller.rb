class UsersController < ApplicationController

  respond_to :html

  # GET /users
  def index
    @users = User.all

    respond_with(@users)
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])

    respond_with(@user)
  end

  # GET /users/new
  def new
    @user = User.new

    respond_with(@user)
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])

    respond_with(@user)
  end

  # POST /users
  def create
    @user = User.create(params[:user])

    respond_with(@user)
  end

  # PATCH /users/:id
  def update
    @user = User.find(params[:id])
    @user.attributes = params[:user]
    @user.save

    respond_with(@user)
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_with(@user)
  end

end
