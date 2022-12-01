class MembersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_member, only: %i[ show edit update destroy ]

    def index
        @members = Member.all
    end

    def show
    end

    def new
        @member = Member.new
    end

    def edit
    end
    
    def create
        @member = Member.new(member_params)

        respond_to do |format|
            if @member.save
                format.html { redirect_to members_path, notice: "Member was successfully created" }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @member.errors, status: :unprocessable_entity }
            end
        end
    end

    def update

        respond_to do |format|
            if @member.update(member_params)
                format.html { redirect_to members_path, notice: "Member was successfully updated" }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @member.errors, status: :unprocessable_entity }
            end
        end
    end

    def delete
        @member = Member.find(params[:id])
    end

    def destroy
        @member = Member.find(params[:id])
        @user = User.where(:email => @member.email).first
        @user.destroy
        @member.destroy
        flash[:notice]="Member '#{@member.full_name}' deleted successfully."
        redirect_to(members_path)
    end

    private

        def set_member
            @member = Member.find(params[:id])
        end

        def member_params
            params.require(:member).permit(:email, :full_name, :card_id, :phone, :graduated, :admin)
        end

end