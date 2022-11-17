class LandingController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @current_member = Member.where(:email => current_user.email).first
        @attendance_total = Attendance.where(:members_id => @current_member.id).count
        @service_point_total = ServicePoint.where(:members_id => @current_member.id).count
        @messages = Message.all

        if @current_member.admin
            @events = Event.order('datetime DESC')
            @meetings = Meeting.order('datetime DESC')
        end
    end
end