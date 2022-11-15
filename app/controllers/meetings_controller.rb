class MeetingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_meeting, only: %i[ show edit update destroy ]

    def index
        @meetings = Meeting.all
    end

    def show
    end

    def new
        @meeting = Meeting.new
    end

    def edit
    end
    
    def create
        @meeting = Meeting.new(meeting_params)

        respond_to do |format|
            if @meeting.save
                format.html{ redirect_to events_path, notice: "Meeting was successfully created"}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @meeting.errors, status: :unprocessable_entity }
            end
        end
    end

    def update

        respond_to do |format|
            if @meeting.update(meeting_params)
                format.html{ redirect_to events_path, notice: "Meeting was successfully updated"}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @meeting.errors, status: :unprocessable_entity }
            end
        end
    end

    def delete
        @meeting = Meeting.find(params[:id])
    end

    def destroy
        @meeting = Meeting.find(params[:id])
        @meeting.destroy
        flash[:notice]="Meeting on date '#{@meeting.datetime}' deleted successfully."
        redirect_to(events_path)
    end

    private

        def set_meeting
            @meeting = Meeting.find(params[:id])
        end

        def meeting_params
            params.require(:meeting).permit(:email, :datetime)
        end
end
