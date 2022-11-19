require 'csv'

class ServicePointsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_service_point, only: %i[ show edit update destroy ]
    
    def index
        @service_points = ServicePoint.all
    end

    def show
    end

    def new
        @service_point = ServicePoint.new
    end

    def edit
    end
    
    def create
        @service_point = ServicePoint.new(service_point_params)

        respond_to do |format|
            if @service_point.save
                format.html { redirect_to '/events', notice: "Service Point was successfully created" }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @service_point.errors, status: :unprocessable_entity }
            end
        end
    end

    def update

        respond_to do |format|
            if @service_point.update(service_point_params)
                format.html { redirect_to '/events', notice: "Service Point was successfully updated" }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @service_point.errors, status: :unprocessable_entity }
            end
        end
    end

    def delete
        @service_point = ServicePoint.find(params[:id])
    end

    def destroy
        @service_point = ServicePoint.find(params[:id])
        @service_point.destroy
        
        flash[:notice]="Service Point for '#{@member.full_name}' at Event '#{@event.title}' deleted successfully."
        redirect_to('/events')
    end

    def upload
    end

    def upload_action
        event = Event.find(params[:events_id])
        file = params[:file]
        file_data = CSV.read(file)

        file_data.each do |row|
            card = row[0]
            member = Member.where(:card_id => card).first
            tardy = row[1] == '1'

            next if member.nil?
            next if event.nil?

            ServicePoint.create(
                events_id: event.id,
                members_id: member.id
            )
        end
        redirect_to('/events')
    end

    private

        def set_service_point
            @service_point = ServicePoint.find(params[:id])
            @member = Member.where(:id => @service_point.members_id).first
            @event = Event.where(:id => @service_point.events_id).first
        end

        def service_point_params
            params.require(:service_point).permit(:events_id, :members_id, :file)
        end

end