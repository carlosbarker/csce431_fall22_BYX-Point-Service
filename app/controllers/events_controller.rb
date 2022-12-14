class EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_event, only: %i[ show edit update destroy ]
    def index
        #@events = Event.where(
            #datetime: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
        #)
        @events = Event.all
        #@meetings = Meeting.where(
            #datetime: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
        #)
        @meetings = Meeting.all

        @service_points = ServicePoint.all
        @attendances = Attendance.all
    end

    def show
    end

    def new
        @event = Event.new
    end

    def edit
    end
    
    def create
        @event = Event.new(event_params)

        respond_to do |format|
            if @event.save
                format.html{ redirect_to events_path, notice: "Event was successfully created"}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

    def update

        respond_to do |format|
            if @event.update(event_params)
                format.html{ redirect_to events_path, notice: "Event was successfully updated"}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

    def delete
        @event = Event.find(params[:id])
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        flash[:notice]="Event '#{@event.title}' deleted successfully."
        redirect_to(events_path)
    end

    private

        def set_event
            @event = Event.find(params[:id])
        end

        def event_params
            params.require(:event).permit(:datetime, :title, :description)
        end
end