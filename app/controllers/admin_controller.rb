class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @events_list = Event.order('datetime DESC')
    @meetings_list = Event.order('datetime DESC')
  end
end