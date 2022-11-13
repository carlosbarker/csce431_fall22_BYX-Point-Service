class MembersController < ApplicationController
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
    
end