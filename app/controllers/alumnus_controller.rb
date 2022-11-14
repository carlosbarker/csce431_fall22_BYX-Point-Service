class AlumnusController < ApplicationController
    def index
        @members = Member.all
    end
end