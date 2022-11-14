class LandingController < ApplicationController
    before_action :authenticate_user!
    def index
        @current_member = Member.where(:email => current_user.email).first
        @service_point_total = ServicePoint.where(:members_id => @current_member.id).count
    end
end