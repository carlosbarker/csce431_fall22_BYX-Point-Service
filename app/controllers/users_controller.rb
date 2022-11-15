class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  # for rspec oauth mock session destroy - ** DO NOT DELETE **
  def show
  end
end
