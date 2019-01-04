class AdminController < ApplicationController

  def index
    if admin
      render 'index'
    end
  end
end