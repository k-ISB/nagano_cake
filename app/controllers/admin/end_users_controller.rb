class Admin::EndUsersController < ApplicationController
  def index
    @users = EndUser.with_deleted
  end

  def show
  end

  def edit
  end

  def update
  end
end
