class MemberDashController < ApplicationController
  before_action :authenticate_member!
end