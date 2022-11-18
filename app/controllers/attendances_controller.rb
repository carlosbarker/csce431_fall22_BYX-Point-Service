require 'csv'

class AttendancesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_attendance, only: %i[ show edit update destroy ]
    
    def index
        @attendances = Attendance.all
    end

    def show
    end

    def new
        @attendance = Attendance.new
    end

    def edit
    end
    
    def create
        @attendance = Attendance.new(attendance_params)

        respond_to do |format|
            if @attendance.save
                format.html { redirect_to root_path, notice: "Attendance record was successfully created" }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @attendance.errors, status: :unprocessable_entity }
            end
        end
    end

    def update

        respond_to do |format|
            if @attendance.update(attendance_params)
                format.html { redirect_to root_path, notice: "Attendance record was successfully updated" }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @attendance.errors, status: :unprocessable_entity }
            end
        end
    end

    def delete
        @attendance = Attendance.find(params[:id])
    end

    def destroy
        @attendance = Attendance.find(params[:id])
        @attendance.destroy
        
        flash[:notice]="Attendance record for '#{@member.full_name}' at meeting '#{@meeting.datetime}' deleted successfully."
        redirect_to(root_path)
    end

    def upload
    end

    def upload_action
        meeting = Meeting.find(params[:meetings_id])
        file = params[:file]
        file_data = CSV.read(file)

        file_data.each do |row|
            card = row[0]
            member = Member.where(:card_id => card).first
            tardy = row[1] == '1'

            next if member.nil?
            next if meeting.nil?

            Attendance.create(
                meetings_id: meeting.id,
                members_id: member.id
            )
        end
        redirect_to(root_path)
    end

    private

        def set_attendance
            @attendance = Attendance.find(params[:id])
            @member = Member.where(:id => @attendance.members_id).first
            @meeting = Meeting.where(:id => @attendance.meetings_id).first
        end

        def attendance_params
            params.require(:attendance).permit(:meetings_id, :members_id, :file)
        end

end