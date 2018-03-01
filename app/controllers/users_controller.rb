class UsersController < ApplicationController
    def index
        @users = User.all_in_alphabetical_order
    end

    def new
    end

    def create
    end

    def show
    end

    def update
    end
