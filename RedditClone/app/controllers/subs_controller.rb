class SubsController < ApplicationController
    before_action :require_logged_in , only: [:edit, :update]

    def require_moderator
        moderator = Sub.find(params[:id]).moderator
        moderator == @current_user
    end 

    def index
        @subs = Sub.all
        render :index
    end

    def new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title,:description,:moderator_id)
    end
end
