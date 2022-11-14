class MessagesController < ApplicationController
    before_action :set_message, only: %i[ show edit update destroy ]

    def index
        @messages = Message.all
    end

    def show
    end

    def new
        @message = Message.new
    end

    def edit
    end
    
    def create
        @message = Message.new(message_params)

        respond_to do |format|
            if @message.save
                format.html { redirect_to root_path, notice: "Message was successfully created" }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @message.errors, status: :unprocessable_entity }
            end
        end
    end

    def update

        respond_to do |format|
            if @message.update(message_params)
                format.html { redirect_to root_path, notice: "Message was successfully updated" }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @message.errors, status: :unprocessable_entity }
            end
        end
    end

    def delete
        @message = Message.find(params[:id])
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        flash[:notice]="Announcement '#{@message.title}' deleted successfully."
        redirect_to(root_path)
    end

    private

        def set_message
            @message = Message.find(params[:id])
        end

        def message_params
            params.require(:message).permit(:title, :body)
        end

end